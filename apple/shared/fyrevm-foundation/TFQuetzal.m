//
//  TFQuetzal.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFQuetzal.h"

static const uint32_t FORM = 'FORM';
static const uint32_t IFZS = 'IFZS';

static const unsigned long TFQuetzalHeaderLength = 12;

// Needed because +[NSString stringWithCString:length:] is deprecated with no length-based replacement. Grr.
static NSString *stringForType(uint32_t type) {

    const uint32_t bigEndianValue = NSSwapHostIntToBig(type);

    const char *cString = (const char *)&bigEndianValue;

    UniChar uniChars[] = { cString[0], cString[1], cString[2], cString[3] };

    return [NSString stringWithCharacters:uniChars length:4];
}

static uint32_t typeAndBytesInDataAtOffset(NSData *data, char *bytes, NSUInteger offset) {
    [data getBytes:bytes range:NSMakeRange(offset, sizeof(uint32_t))];
    
    return NSSwapBigIntToHost(*((uint32_t *)bytes));
}

static uint32_t typeInDataAtOffset(NSData *data, NSUInteger offset) {
    uint32_t temp;

    [data getBytes:&temp range:NSMakeRange(offset, sizeof(uint32_t))];
    
    return NSSwapBigIntToHost(temp);
}

static BOOL lastByteIsZero(NSData *data) {
    const char *lastBytePtr = [data bytes] + [data length] - 1;

    return *lastBytePtr == 0;
}

static void appendIntToData(uint32_t integer, NSMutableData *data) {
    uint32_t temp = NSSwapHostIntToBig(integer);
    
    [data appendBytes:(const void *)&temp length:sizeof(uint32_t)];
}

@implementation TFQuetzal

#pragma mark APIs

+ (TFQuetzal *)gameSessionWithContentsOfFile:(NSString *)path {
    NSAssert1(path != nil || [path length] == 0, @"%@ called with nil or blank path.", NSStringFromSelector(_cmd));

    NSString *errorString = nil;
    
    TFQuetzalLoadError errorCode = TFQuetzalNoLoadError;
    
    TFQuetzal *result = [self gameSessionWithContentsOfFile:path errorString:&errorString errorCode:&errorCode];

    if (result == nil) {
        NSLog(@"Error loading Quetzal saved-game session file at path \"%@\". %@", path, errorString);
    }
    
    return result;
}

- (NSData *)chunkForType:(uint32_t)type {
    NSNumber *number = [[NSNumber alloc] initWithUnsignedInt:type];

    NSData *result = [chunks objectForKey:number];
    
    [number release];
    
    return result;
}
- (void)setChunk:(NSData *)chunk forType:(uint32_t)type {
    NSNumber *number = [[NSNumber alloc] initWithUnsignedInt:type];
    
    [chunks setObject:chunk forKey:number];
    
    // If there are tons of types, or setChunk:forType: is called a lot for replacement purposes, then this could be optimized better. That doesn't seem to be the case now, however.
    if ([typeAddOrder containsObject:number] == NO) {
        [typeAddOrder addObject:number];
    }
    
    [number release];
}

- (BOOL)writeToFile:(NSString *)path error:(NSError **)error {
    NSUInteger length = 4;
    
    for (NSNumber *key in chunks) {
        NSData *chunk = [chunks objectForKey:key];
        length += (8 + [chunk length]);
    }
    
    NSMutableData *data = [[NSMutableData alloc] initWithCapacity:length];
    
    appendIntToData(FORM, data);
    appendIntToData(length, data);
    appendIntToData(IFZS, data);
    
    for (NSNumber *key in typeAddOrder) {
        const uint32_t number = [key unsignedIntValue];       
        appendIntToData(number, data);
        
        NSData *chunk = [chunks objectForKey:key];

        const uint32_t length = (uint32_t)[chunk length];
        appendIntToData(length, data);
    
        [data appendData:chunk];
    }
    
    if ([data length] % 2 == 1) {
        const char zeroByte = 0;
        [data appendBytes:&zeroByte length:1];
    }
    
    return [data writeToFile:path options:0 error:error];;
}

#pragma mark Standard methods

- (id)init {
    self = [super init];
    
    chunks = [[NSMutableDictionary alloc] init];
    typeAddOrder = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)dealloc {
    [chunks release], chunks = nil;
    [typeAddOrder release], typeAddOrder = nil;

    [super dealloc];
}

#pragma mark Exposed for testing ONLY, DO NOT USE

+ (TFQuetzal *)gameSessionWithContentsOfFile:(NSString *)path errorString:(NSString **)errorStringPtr errorCode:(TFQuetzalLoadError *)errorCodePtr {
    NSAssert1(errorStringPtr != nil, @"%@ called with nil errorString pointer.", NSStringFromSelector(_cmd));
    NSAssert1(errorCodePtr != nil, @"%@ called with nil errorCode pointer.", NSStringFromSelector(_cmd));

    TFQuetzal *result = nil;

    NSString *errorString = nil;
    TFQuetzalLoadError errorCode = TFQuetzalNoLoadError;
    
    NSError *error = nil;

    // TODO this code assumes file can be read in on the main thread without appreciable delay, which should be tested.
    NSData *data = [NSData dataWithContentsOfFile:path options:0 error:&error];
    if (data == nil) { 
        errorString = [NSString stringWithFormat:@"error reading contents of file: %@.", error]; 
        errorCode = TFQuetzalErrorReadingFileContents;
    } else {

        // ==================================================================
        // Header
        // ==================================================================
    
        if ([data length] < TFQuetzalHeaderLength) {
            errorString = [NSString stringWithFormat:@"should be long enough to contain initial %lu-byte \"header\", but is only %lu bytes in length.", TFQuetzalHeaderLength, (unsigned long)[data length]];
            errorCode = TFQuetzalFileShorterThanHeader;
        } else {
            //
            // Section 8.3.1, chunk starts with ID, ID is the concatenation of four ASCII characters
            // Section 8.5, 'FORM' type ID, only top-level chunk of simple IFF file
            //
            char typeChars[4];
            uint32_t type = typeAndBytesInDataAtOffset(data, typeChars, 0);
            if (type != FORM) {
                errorString = [NSString stringWithFormat:@"should start with 4-byte type code '%@', but instead the first 4 bytes are %u, %u, %u, %u.", 
                                                            stringForType(FORM), 
                                                            (int)typeChars[0], (int)typeChars[1], (int)typeChars[2], (int)typeChars[3]];
                errorCode = TFQuetzalHeaderTypeUnsupported;
            } else {
                //
                // Section 8.3.5, length follows ID, 32-bit big-endian unsigned integer
                //
                const uint32_t length = typeInDataAtOffset(data, 4);
                if (length < 4) {
                    errorString = [NSString stringWithFormat:@"should have at least 4 additional bytes of content after initial 8 bytes, but length value in 5th-through-8th bytes of file indicates only %lu bytes.", (unsigned long)length];
                    errorCode = TFQuetzalHeaderLengthTooShort;
                } else {
                    //
                    // Section 8.6, 'IFZS' type sub-ID
                    //
                    // Note: ID + length + sub-ID == 12 bytes == this code's informal concept of an file "header"
                    type = typeAndBytesInDataAtOffset(data, typeChars, 8);
                    if (type != IFZS) {
                        errorString = [NSString stringWithFormat:@"should have 4-byte type code '%@' in 9th-through-12th bytes, but instead those 4 bytes are %u, %u, %u, %u.", stringForType(IFZS), (int)typeChars[0], (int)typeChars[1], (int)typeChars[2], (int)typeChars[3]];
                        errorCode = TFQuetzalHeaderSubtypeUnsupported;
                    } else {

                        // ==================================================================
                        // Remaining
                        // ==================================================================

                        // Either
                        // (1) specified length must be exactly the actual file length
                        if (length + 8 != [data length] && 
                            // (2) *OR*, per Windows code behavior, specified length must be odd and 1 byte shorter than actual length, and last byte is zero-byte padding.
                            (length % 2 != 1 || length + 9 != [data length] || lastByteIsZero(data) == NO)) {
                            errorString = [NSString stringWithFormat:@"file length, per \"header\", should be %lu bytes (length + 8), but instead is %lu bytes.", 
                                                                        (unsigned long)(length + 8),
                                                                        [data length]];
                            errorCode = TFQuetzalFileNotEqualToLength;
                        } else {
                            TFQuetzal *temp = [[[TFQuetzal alloc] init] autorelease];
                            
                            //
                            // Section 8.6, concatenation of (sub-)chunks
                            //
                            const NSUInteger chunksLength = length + 8;
                        
                            uint32_t position = TFQuetzalHeaderLength;
                            while (position < chunksLength) {
                                if (chunksLength - position == 1 && lastByteIsZero(data)) {
                                    ++position;
                                } else if (chunksLength - position < 8) {
                                    errorString = [NSString stringWithFormat:@"should enough remaining content at index %lu for a 4-byte type code and a 4-byte length value, but instead only has %lu bytes.", 
                                                                                (unsigned long)position,
                                                                                (unsigned long)(chunksLength - position)];
                                    errorCode = TFQuetzalChunkTooShort;
                                    break;
                                } else {
                                    const uint32_t chunkType = typeAndBytesInDataAtOffset(data, typeChars, position);
                                    position += 4;
                                    const uint32_t chunkLength = typeInDataAtOffset(data, position);
                                    position += 4;
                                    if (chunkLength > chunksLength - position) {
                                        errorString = [NSString stringWithFormat:@"per chunk length value at index %lu for chunk type '%@', should have %lu more bytes of content, but instead only has %lu bytes.", 
                                                                                (unsigned long)(position + TFQuetzalHeaderLength),
                                                                                stringForType(chunkType),
                                                                                (unsigned long)chunkLength, 
                                                                                (unsigned long)(chunksLength - position)];
                                        errorCode = TFQuetzalFileShorterThanChunk;
                                        break;
                                    } else {
                                        NSData *chunkData = [data subdataWithRange:NSMakeRange(position, chunkLength)];
                                        [temp setChunk:chunkData forType:chunkType];
                                    }
                                    
                                    position += chunkLength;
                                }
                            }
                            
                            if (errorCode == TFQuetzalNoLoadError && position > chunksLength) {
                                errorString = [NSString stringWithFormat:@"should end when last chunk ends, but last chunk ends at %lu bytes, while file is %lu bytes long.", 
                                                                            (unsigned long)position,
                                                                            (unsigned long)chunksLength];
                                errorCode = TFQuetzalNonZeroOddByte;
                            }
                            
                            // *** SUCCESS ***
                            if (errorCode == TFQuetzalNoLoadError) {
                                result = temp;
                            }
                        }
                    }
                }
            }
        }
    }

    (*errorStringPtr) = errorString;
    (*errorCodePtr) = errorCode;

    return result;
}

@end
