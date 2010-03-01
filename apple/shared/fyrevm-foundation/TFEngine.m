//
//  TFEngine.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine.h"

#import "TFUlxImage.h"
#import "GlulxConstants.h"
#import "TFOpcode.h"
#import "TFVeneer.h"

static const NSUInteger TFEngineFirstMajorVersion = 2;
static const NSUInteger TFEngineFirstMinorVersion = 0;
static const NSUInteger TFEngineLastMajorVersion = 3;
static const NSUInteger TFEngineLastMinorVersion = 1;

@implementation TFEngine

@synthesize image;

#pragma mark Private methods

/*! Compares version numbers of image to what this game engine supports.

    On failure, technical details will be printed to Console.
 */
- (BOOL)isImageVersionCompatible:(TFUlxImage *)theImage {
    NSUInteger majorVersion = [theImage majorVersion];
    NSUInteger minorVersion = [theImage minorVersion];

    BOOL result =
        (majorVersion < TFEngineFirstMajorVersion ||
        (majorVersion == TFEngineFirstMajorVersion && minorVersion < TFEngineFirstMinorVersion) ||
        majorVersion > TFEngineLastMajorVersion ||
        (majorVersion == TFEngineLastMajorVersion && minorVersion > TFEngineLastMinorVersion));

    if (result == NO) {
        NSLog(@"Glulx (.ulx) game file at path \"%@\" has major version %lu and minor version %lu, which are not compatible with this game engine's first major version number %lu, first minor version number %lu, last major version number %lu, last minor version number %lu", 
                theImage.path, 
                (unsigned long)majorVersion,
                (unsigned long)minorVersion,
                (unsigned long)TFEngineFirstMajorVersion,
                (unsigned long)TFEngineFirstMinorVersion,
                (unsigned long)TFEngineLastMajorVersion,
                (unsigned long)TFEngineLastMinorVersion);
    }
    
    return result;
}

/*! Method to call to dispose of resources. Is called by -dealloc, but also may be called early. Is called by -loadGameImageFromPath: on failure.
 */
- (void)cleanup {
    [opcodeDict release], opcodeDict = nil;

    [image  cleanup], [image release], image = nil;

    [stack release], stack = nil;

    [veneer release], veneer = nil;
}

#pragma mark APIs

- (BOOL)loadGameImageFromPath:(NSString *)path {
    NSAssert(image == nil, @"loadGameImageFromPath: called when image has already been set to something!");

    BOOL result = NO;
    
    image = [[TFUlxImage alloc] init];
    
    if ([image loadFromPath:path]) {
    
        if ([self isImageVersionCompatible:image]) {
            uint32_t stackSize = [image integerAtOffset:TFGlulxHeaderStackSizeOffset];
            stack = [[NSMutableData alloc] initWithLength:stackSize];

            result = [self initOpcodeDictionary];
        }
    }
    
    if (result == NO) {
        [self cleanup];
    }

    return result;
}

// Move to TFEngine_Opcodes.m?

- (void)push:(uint32_t)value {
    uint32_t bigEndianValue = NSSwapHostIntToBig(value);
    [stack appendBytes:&bigEndianValue length:sizeof(uint32_t)];
    sp += 4;
}

- (void)setStackInteger:(uint32_t)value atOffset:(uint32_t)offset {
    uint32_t bigEndianValue = NSSwapHostIntToBig(value);
    [stack replaceBytesInRange:NSMakeRange(offset, sizeof(value)) withBytes:&bigEndianValue length:sizeof(value)];
}

- (uint32_t)pop {
    sp -= 4;
    
    return [self readFromStack:sp];
}

- (uint32_t)readFromStack:(uint32_t)position
{
    uint32_t value;
    
    [stack getBytes:&value range:NSMakeRange(position, sizeof(uint32_t))];

    return NSSwapBigIntToHost(value);
}

-(void)pushCallStub:(TFCallStub)stub
{
    [self push:stub.destType];
    [self push:stub.destAddr];
    [self push:stub.pc];
    [self push:stub.framePtr];
}

- (TFCallStub)popCallStub
{
    TFCallStub stub;

    stub.framePtr = [self pop];
    stub.pc = [self pop];
    stub.destAddr = [self pop];
    stub.destType = [self pop];

    return stub;
}

- (uint32_t)nestedCallAtAddress:(uint32_t)address {
    return [self nestedCallAtAddress:address args:NULL];
}

- (uint32_t)nestedCallAtAddress:(uint32_t)address arg:(uint32_t)arg1 {
    uint32_t args[] = { arg1 };

    return [self nestedCallAtAddress:address args:args];
}

- (uint32_t)nestedCallAtAddress:(uint32_t)address arg:(uint32_t)arg1 arg:(uint32_t) arg2 {
    uint32_t args[] = { arg1, arg2 };

    return [self nestedCallAtAddress:address args:args];
}

- (uint32_t)nestedCallAtAddress:(uint32_t)address arg:(uint32_t)arg1 arg:(uint32_t)arg2 arg:(uint32_t)arg3 {
    uint32_t args[] = { arg1, arg2, arg3 };

    return [self nestedCallAtAddress:address args:args];
}

/*! Executes a Glulx function and returns its result.

    \param address The address of the function.
    \param args The list of arguments, or NULL if no arguments need to be passed in.

    \return The function's return value.
 */
- (uint32_t)nestedCallAtAddress:(uint32_t)address args:(uint32_t *)args {
/*
    ExecutionMode oldMode = execMode;
    byte oldDigit = printingDigit;

    PerformCall(address, args, FYREVM_STUB_RESUME_NATIVE, 0);
    nestingLevel++;
    try
    {
        InterpreterLoop();
    }
    finally
    {
        nestingLevel--;
        execMode = oldMode;
        printingDigit = oldDigit;
    }

    return nestedResult;
*/
    return 0;
}

- (void)performDelayedStoreOfType:(uint32_t)type address:(uint32_t)address value:(uint32_t)value {
    if (type == TFGlulxStubStoreNULL) {
        // discard
    } else if (type == TFGlulxStubStoreMemory) {
        // store in main memory
        [image setInteger:value atOffset:address];
    } else if (TFGlulxStubStoreLocal) {
        // store in local storage
        [self setStackInteger:fp + localsPos + address atOffset:value];
    } else if (TFGlulxStubStoreStack) {
        // push onto stack
        [self push:value];
    }
}

#pragma mark -

- (void)leaveFunction:(uint32_t)result {
    NSAssert(NO, @"Not yet implemented!");
}

- (void)takeBranch:(uint32_t)target
{
    if (target == 0)
        [self leaveFunction:0];
    else if (target == 1)
        [self leaveFunction:1];
    else
        pc += target - 2;
}

#pragma mark Search APIs


- (int)compareKeysWithQuery:(uint32_t)query candidate:(uint32_t)candidate keySize:(uint32_t)keySize options:(TFSearchOptions)options {
    if ((options & TFKeyIndirectSearchOption) == 0) {
        uint32_t ckey;
        switch (keySize) {
            case 1:
                ckey = [image byteAtOffset:candidate];
                query &= 0xFF;
                break;
            case 2:
                ckey = [image shortAtOffset:candidate];
                query &= 0xFFFF;
                break;
            case 3:
                ckey = (uint32_t)([image byteAtOffset:candidate] << 24 + [image shortAtOffset:candidate + 1]);
                query &= 0xFFFFFF;
                break;
            default:
                ckey = [image integerAtOffset:candidate];
                break;
        }

        if (query < ckey) {
            return -1;
        } else if (query > ckey) {
            return 1;
        } else {
            return 0;
        }
    }

    for (uint32_t i = 0; i < keySize; i++)
    {
        uint8_t b1 = [image byteAtOffset:query++];
        uint8_t b2 = [image byteAtOffset:candidate++];
        if (b1 < b2) {
            return -1;
        } else if (b1 > b2) {
            return 1;
        }
    }

    return 0;
}

- (uint32_t)performBinarySearchWithKey:(uint32_t)key keySize:(uint32_t)keySize start:(uint32_t)start structSize:(uint32_t)structSize numStructs:(uint32_t)numStructs keyOffset:(uint32_t)keyOffset options:(TFSearchOptions)options {
    if ((options & TFReturnIndexSearchOption) != 0) {
//        @throw [NSException exceptionWithName:@"TFException" reason:@"TFReturnIndexSearchOption may not be used with binarysearch" userInfo:nil];
    } else if (keySize > 4 && (options & TFKeyIndirectSearchOption) == 0) {
//        throw new VMException("KeyIndirect option must be used when searching for a >4 byte key");
    }

    uint32_t result = (options & TFReturnIndexSearchOption) == 0 ? 0 : 0xFFFFFFFF;
    uint32_t low = 0, high = numStructs;

    while (low < high)
    {
        uint32_t index = (low + high) / 2;
        int cmp = [self compareKeysWithQuery:key candidate:start + index * structSize + keyOffset keySize:keySize options:options];
        if (cmp == 0)
        {
            // found it
            if ((options & TFReturnIndexSearchOption) == 0)
                result = start + index * structSize;
            else
                result = index;
            break;
        }
        else if (cmp < 0)
        {
            high = index;
        }
        else
        {
            low = index + 1;
        }
    }
    return result;
}


#pragma mark Exposed for testing ONLY, DO NOT USE

- (BOOL)initOpcodeDictionary {
    BOOL result = NO;

    opcodeDict = [[TFOpcode opcodeDictionary] retain];
    if (opcodeDict != nil) {
        // Keys are sorted so, if there are errors, the order of the errors is deterministic. Errors may not be in order of original plist entries.
        for (NSNumber *opcodeNumber in [[opcodeDict allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
            TFOpcode *opcode = [opcodeDict objectForKey:opcodeNumber];
            if ([self respondsToSelector:opcode.selector] == NO) {
                NSLog(@"%@ has selector that is not implemented in %@.", opcode, [self class]);
            }
        }
    }
    
    return result;
}

#pragma mark Standard methods

- (id)init {
    self = [super init];
    
    veneer = [[TFVeneer alloc] init];
    
    return self;
}

- (void)dealloc {
    [self cleanup];

    [super dealloc];
}

@end
