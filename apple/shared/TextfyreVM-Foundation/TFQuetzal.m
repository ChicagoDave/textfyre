//
//  TFQuetzal.m
//  TextfyreVM-Foundation
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

+ (NSData *)compressMemory:(NSData *)memory range:(NSRange)range
            originalMemory:(NSData *)originalMemory originalRange:(NSRange)originalRange {
    NSAssert3(NSMaxRange(range) > [memory length], @"%@ called with range %@ but memory only of length %lu", 
                NSStringFromSelector(_cmd), NSStringFromRange(range), (unsigned long)[memory length]);
    NSAssert3(NSMaxRange(originalRange) > [originalMemory length], @"%@ called with originalRange %@ but originalMemory only of length %lu", 
                NSStringFromSelector(_cmd), NSStringFromRange(originalRange), (unsigned long)[originalMemory length]);
    NSAssert3([memory length] >= [originalMemory length], @"%@ called with changed/new memory block of length %lu, which is (but should not be) shorter than original memory block of length %lu",
                NSStringFromSelector(_cmd), (unsigned long)[memory length], (unsigned long)[originalMemory length]);

    NSMutableData *result = [NSMutableData data];
    
    appendIntToData((uint32_t)range.length, result);
    
    unsigned char bytes[2] = {0, 0};
    
    for (NSUInteger i = 0; i < originalRange.length; ++i) {
        unsigned char b = (((const unsigned char *)[originalMemory bytes])[originalRange.location+i] ^ ((const unsigned char *)[memory bytes])[range.location+i]);
        if (b == 0) {
            NSUInteger runLength;
            for (runLength = 1; i + runLength < originalRange.length; ++runLength) {
                if (runLength == 256) {
                    break;
                }
                if (((const unsigned char *)[originalMemory bytes])[originalRange.location + i + runLength] != ((const unsigned char *)[memory bytes])[range.location + i + runLength]) {
                    break;
                }
            }
            
            bytes[1] = runLength - 1;

            [result appendBytes:bytes length:2];
            i += runLength - 1;
        } else {
            [result appendBytes:&b length:1];
        }
    }
    
    return result;
}

+ (NSData *)decompressMemory:(NSData *)originalMemory delta:(NSData *)delta {
    return nil;
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
    NSAssert2(errorStringPtr != nil, @"%@ called with nil errorString pointer for file at path \"%@\".", NSStringFromSelector(_cmd), path);
    NSAssert2(errorCodePtr != nil, @"%@ called with nil errorCode pointer for file at path \"%@\".", NSStringFromSelector(_cmd), path);

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
                                if (length % 2 != 1 && chunksLength - position == 1 && lastByteIsZero(data)) {
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
                            
                            // *** SUCCESS ***
                            if (errorCode == TFQuetzalNoLoadError) {
                                // Shouldn't happen if logic above is right.
                                NSAssert3(position == chunksLength, @"On successful read, when done reading chunks, we should be done reading file, but we've read chunks successfully to index %lu of file, and file length is different value, %lu bytes, for file at path \"%@\".", (unsigned long)position, (unsigned long)chunksLength, path);

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
