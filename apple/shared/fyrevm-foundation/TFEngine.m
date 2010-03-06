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
#import "TFArguments.h"

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

- (uint32_t)nestedCallAtAddress:(uint32_t)address args:(TFArguments *)args {
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
    switch (type) {
        case TFGlulxStubStoreNULL:
            // discard
            break;
        case TFGlulxStubStoreMemory:
            // store in main memory
            [image setInteger:value atOffset:address];
            break;
        case TFGlulxStubStoreLocal:
            // store in local storage
            [self setStackInteger:fp + localsPos + address atOffset:value];
            break;
        case TFGlulxStubStoreStack:
            // push onto stack
            [self push:value];
            break;
    }
}

- (void)enterFunctionAtAddress:(uint32_t)address {
    [self enterFunctionAtAddress:address args:NULL];
}

- (void)enterFunctionAtAddress:(uint32_t)address args:(TFArguments *)args {
    execMode = TFExecutionModeCode;

    // push a call frame
    fp = sp;
    [self push:0];  // temporary FrameLen
    [self push:0];  // temporary LocalsPos

    // copy locals info into the frame...
    uint32_t localSize = 0;

    for (uint32_t i = address + 1; YES; i += 2) {
        uint8_t type, count;
        
        type = [image byteAtOffset:i];
        [stack replaceBytesInRange:NSMakeRange(sp++, sizeof(type)) withBytes:&type];
        
        count = [image byteAtOffset:1];
        [stack replaceBytesInRange:NSMakeRange(sp++, sizeof(count)) withBytes:&count];
        
        if (type == 0 || count == 0) {
            pc = i + 2;
            break;
        }
        if (localSize % type > 0) {
            localSize += (type - (localSize % type));
        }
        localSize += (uint32_t)(type * count);
    }
    // padding
    if (sp % 4 > 0) {
        [stack resetBytesInRange:NSMakeRange(sp, (sp / 4 * 4) + 3)];
        sp = ((sp / 4) + 1) * 4;
    }

    localsPos = sp - fp;
    [self setStackInteger:fp + 4 atOffset:localsPos]; // fill in LocalsPos

    if (args == NULL || args.count == 0) {
        // initialize space for locals
        if (sp < localSize) {
            [stack resetBytesInRange:NSMakeRange(sp, localSize - sp)];
        }
    } else {
        // copy initial values as appropriate
        uint32_t offset = 0, lastOffset = 0;
        uint8_t size = 0, count = 0;
        address++;
        for (uint32_t argnum = 0; argnum < args.count; argnum++)
        {
            if (count == 0) {
                size = [image byteAtOffset:address++];
                count = [image byteAtOffset:address++];
                if (size == 0 || count == 0)
                    break;
                if (offset % size > 0)
                    offset += (size - (offset % size));
            }

            // zero any padding space between locals
            if (lastOffset < offset) {
                [stack resetBytesInRange:NSMakeRange(lastOffset, offset - lastOffset)];
            }

            switch (size) {
                case 1: {
                    uint8_t value = (uint8_t)[args argAtIndex:argnum];
                    [stack replaceBytesInRange:NSMakeRange(sp + offset, sizeof(value)) withBytes:&value];
                    break;
                }
                case 2: {
                    uint16_t value = (uint16_t)[args argAtIndex:argnum];
                    uint16_t bigEndianValue = NSSwapHostShortToBig(value);
                    
                    [stack replaceBytesInRange:NSMakeRange(sp + offset, sizeof(bigEndianValue)) withBytes:&bigEndianValue];
                    break;
                }
                case 4:
                    [self setStackInteger:sp + offset atOffset:[args argAtIndex:argnum]];
                    break;
            }

            offset += size;
            lastOffset = offset;
            count--;
        }

        // zero any remaining local space
        if (lastOffset < localSize) {
            [stack resetBytesInRange:NSMakeRange(lastOffset, localSize - lastOffset)];
        }
    }
    sp += localSize;
    // padding
    if (sp % 4 > 0) {
        [stack resetBytesInRange:NSMakeRange(sp, (sp / 4 * 4) + 3)];
        sp = ((sp / 4) + 1) * 4;
    }

    frameLen = sp - fp;
    [self setStackInteger:fp atOffset:frameLen]; // fill in FrameLen
}

- (void)leaveFunction:(uint32_t)result {
    if (fp == 0) {
        // top-level function
        running = false;
    } else {
        NSAssert2(sp >= fp, @"leaveFunction: called when sp %lu >= fp %lu", (unsigned long)sp, (unsigned long)fp);
        sp = fp;
        [self resumeFromCallStub:result];
    }
}
- (void)resumeFromCallStub:(uint32_t)result {
    TFCallStub stub = [self popCallStub];

    pc = stub.pc;
    execMode = TFExecutionModeCode;

    uint32_t newFP = stub.framePtr;
    uint32_t newFrameLen = [self readFromStack:newFP];
    uint32_t newLocalsPos = [self readFromStack:newFP + 4];

    switch (stub.destType)
    {
        case TFGlulxStubStoreNULL:
            // discard
            break;
        case TFGlulxStubStoreMemory:
            // store in main memory
            [image setInteger:result atOffset:stub.destAddr];
            break;
        case TFGlulxStubStoreLocal:
            // store in local storage
            [self setStackInteger:newFP + newLocalsPos + stub.destAddr atOffset:result];
            break;
        case TFGlulxStubStoreStack:
            // push onto stack
            [self push:result];
            break;

        case TFGlulxStubResumeFunction:
            // resume executing in the same call frame
            // return to avoid changing FP
            return;

        case TFGlulxStubResumeCString:
            // resume printing a C-string
            execMode = TFExecutionModeCString;
            break;
        case TFGlulxStubResumeUnicodeString:
            // resume printing a Unicode string
            execMode = TFExecutionModeUnicodeString;
            break;
        case TFGlulxStubResumeNumber:
            // resume printing a decimal number
            execMode = TFExecutionModeNumber;
            printingDigit = (uint8_t)stub.destAddr;
            break;
        case TFGlulxStubResumeCompressedString:
            // resume printing a compressed string
            execMode = TFExecutionModeCompressedString;
            printingDigit = (uint8_t)stub.destAddr;
            break;

        case TFFyreVMStubResumeNative:
            // exit the interpreter loop and return via NestedCall()
            nestedResult = result;
            execMode = TFExecutionModeReturn;
            break;
    }

    fp = newFP;
    frameLen = newFrameLen;
    localsPos = newLocalsPos;
    return;
}

#pragma mark -

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
