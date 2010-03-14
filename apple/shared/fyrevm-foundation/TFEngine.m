//
//  TFEngine.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine.h"

#import "GlulxConstants.h"
#import "TFArguments.h"
#import "TFEngine_Opcodes.h"
#import "TFEngine_Output.h"
#import "TFHeapAllocator.h"
#import "TFOpcode.h"
#import "TFStrNode.h"
#import "TFUlxImage.h"
#import "TFVeneer.h"

static const NSUInteger TFEngineFirstMajorVersion = 2;
static const NSUInteger TFEngineFirstMinorVersion = 0;
static const NSUInteger TFEngineLastMajorVersion = 3;
static const NSUInteger TFEngineLastMinorVersion = 1;

@interface TFEngine()

/*! \brief Runs the main interpreter loop.

    In Windows version, this goes on forever. 
    
    In Apple version, it's much better to let the system run its own event loop, and only do something when we're called. So this ends on indication from game that user input is expected.
    
    On success, returns YES, and application code flow should be allowed to finish and pass back to system.
    
    On any sort of unrecoverable error, returns NO, at which point technical details will be printed to Console, and application should end. (TODO see if that works.)
 */
- (BOOL)interpreterLoop;

- (void)storeResult:(TFOpcodeRule)rule type:(uint8_t)type address:(uint32_t)address value:(uint32_t)value;

- (uint32_t)decodeLoadOperand:(TFOpcodeRule)rule type:(uint8_t)type operandPos:(uint *)operandPos;

- (uint32_t)decodeStoreOperand:(TFOpcodeRule)rule type:(uint8_t)type operandPos:(uint32_t *)operandPos;

- (void)decodeDelayedStoreOperand:(uint8_t)type operandPos:(uint *)operandPos
                      resultArray:(uint32_t *)resultArray resultIndex:(int)resultIndex;

@end


@implementation TFEngine

@synthesize image;
@synthesize pc;
@synthesize fp;
@synthesize outputSystem;
@synthesize filterAddress;
@synthesize execMode;
@synthesize printingDigit;


#pragma mark Private methods

/*! Compares version numbers of image to what this game engine supports.

    If image version is supported, returns YES.
    
    If image version is not supported, returns NO, at which point technical details will be printed to Console.
 */
- (BOOL)isImageVersionCompatible:(TFUlxImage *)theImage {
    NSUInteger majorVersion = [theImage majorVersion];
    NSUInteger minorVersion = [theImage minorVersion];

    BOOL result =
        ((majorVersion > TFEngineFirstMajorVersion ||
         majorVersion == TFEngineFirstMajorVersion && minorVersion >= TFEngineFirstMinorVersion) &&
         (majorVersion < TFEngineLastMajorVersion ||
          majorVersion == TFEngineLastMajorVersion && minorVersion <= TFEngineLastMinorVersion));

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

/*! Clears the stack and initializes VM registers from values found in RAM. */
- (void)bootstrap {
    uint32_t mainfunc = [image integerAtOffset:TFGlulxHeaderStartFunctionOffset];
    decodingTable = [image integerAtOffset:TFGlulxHeaderDecodingTableOffset];

    sp = fp = frameLen = localsPos = 0;
    outputSystem = TFIOSystemNull;
    execMode = TFExecutionModeCode;
    [self enterFunctionAtAddress:mainfunc];
}

/*! Method to call to dispose of resources. Is called by -dealloc, but also may be called early. Is called by -loadGameImageFromPath: on failure.
 */
- (void)cleanup {
    [opcodeDict release], opcodeDict = nil;

    [image release], image = nil;
    
    [heap release], heap = nil;

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

- (BOOL)run {
    BOOL result = YES;
    
    // initialize registers and stack
    [self bootstrap];
    // TODO this can have errors, should return BOOL and message Console.
    [self cacheDecodingTable];

    if (result) {
        // run the game, up to user input.
        result = [self interpreterLoop];
        
        // NOTE: Game does *NOT END* here. This just means control should pass back to system for regular event loop.
    }
    
    return result;
}

- (uint32_t)nestedCallAtAddress:(uint32_t)address {
    return [self nestedCallAtAddress:address args:NULL];
}

- (uint32_t)nestedCallAtAddress:(uint32_t)address args:(TFArguments *)args {
    TFExecutionMode oldMode = execMode;
    uint8_t oldDigit = printingDigit;

    [self performCallWithAddress:address args:args destType:TFFyreVMStubResumeNative destAddr:0];
    nestingLevel++;
    @try {
        // TODO check output of this method.
        // And in Apple fashion of returning on user input, will this return too soon for this logic?
        [self interpreterLoop];
    } @finally {
        nestingLevel--;
        execMode = oldMode;
        printingDigit = oldDigit;
    }

    return nestedResult;
}

#define MAX_OPERANDS        8

- (BOOL)interpreterLoop {
    BOOL result = YES;

    uint32_t operands[MAX_OPERANDS] = {0};
    uint32_t resultAddrs[MAX_OPERANDS] =  {0};
    uint8_t resultTypes[MAX_OPERANDS] =  {0};

    // TODO stop on expected user input.
    while (running) {
        switch (execMode) {
            case TFExecutionModeCode: {
                // decode opcode number
                uint32_t opnum = [image byteAtOffset:pc];
                if (opnum >= 0xC0) {
                    opnum = [image integerAtOffset:pc] - 0xC0000000;
                    pc += 4;
                } else if (opnum >= 0x80) {
                    opnum = (uint32_t)([image shortAtOffset:pc] - 0x8000);
                    pc += 2;
                } else {
                    pc++;
                }

                // look up opcode info
                TFOpcode *opcode = nil;
//                @try {
                    NSNumber *opcodeNumber = [[NSNumber alloc] initWithUnsignedInt:opnum];
                    opcode = [opcodeDict objectForKey:opcodeNumber];
                    [opcodeNumber release];
                    //TODOWriteTrace("[" + opcode.ToString());
                // TODO
/*                } @catch (KeyNotFoundException)
                {
                    throw new VMException(string.Format("Unrecognized opcode {0:X}h", opnum));
                }*/

                // decode load-operands
                uint32_t opcount = (uint32_t)(opcode.loadArgs + opcode.storeArgs);
                if (opcode.rule == TFOpcodeRuleDelayedStore) {
                    opcount++;
                } else if (opcode.rule == TFOpcodeRuleCatch) {
                    opcount += 2;
                }
                uint32_t operandPos = pc + (opcount + 1) / 2;

                for (int i = 0; i < opcode.loadArgs; i++) {
                    uint8_t type = 0;
                    if (i % 2 == 0) {
                        type = ([image byteAtOffset:pc] & 0xF);
                    } else {
                        type = (([image byteAtOffset:pc] >> 4) & 0xF);
                        pc++;
                    }

                    //TODOWriteTrace(" ");
                    operands[i] = [self decodeLoadOperand:opcode.rule type:type operandPos:&operandPos];
                }

                // decode store-operands
                for (int i = 0; i < opcode.storeArgs; i++) {
                    uint8_t type = 0;
                    if ((opcode.loadArgs + i) % 2 == 0) {
                        type = (uint8_t)([image byteAtOffset:pc] & 0xF);
                    } else {
                        type = (uint8_t)(([image byteAtOffset:pc] >> 4) & 0xF);
                        pc++;
                    }

                    resultTypes[i] = type;
                    //TODOWriteTrace(" -> ");
                    resultAddrs[i] = [self decodeLoadOperand:opcode.rule type:type operandPos:&operandPos];
                }

                if (opcode.rule == TFOpcodeRuleDelayedStore ||
                    opcode.rule == TFOpcodeRuleCatch) {
                    // decode delayed store operand
                    uint8_t type = 0;
                    if ((opcode.loadArgs + opcode.storeArgs) % 2 == 0) {
                        type = (uint8_t)([image byteAtOffset:pc] & 0xF);
                    } else {
                        type = (uint8_t)(([image byteAtOffset:pc] >> 4) & 0xF);
                        pc++;
                    }

                    //TODOWriteTrace(" -> ");
                    [self decodeDelayedStoreOperand:type operandPos:&operandPos resultArray:operands resultIndex:opcode.loadArgs + opcode.storeArgs];
                }

                if (opcode.rule == TFOpcodeRuleCatch) {
                    // decode final load operand for @catch
                    uint8_t type = 0;
                    if ((opcode.loadArgs + opcode.storeArgs + 1) % 2 == 0) {
                        type = (uint8_t)([image byteAtOffset:pc] & 0xF);
                    } else {
                        type = (uint8_t)(([image byteAtOffset:pc] >> 4) & 0xF);
                        pc++;
                    }

                    //TODOWriteTrace(" ?");
                    operands[opcode.loadArgs + opcode.storeArgs + 2] =
                        [self decodeLoadOperand:opcode.rule type:type operandPos:&operandPos];
                }

                //TODOWriteTrace("]\r\n");

                // call opcode implementation
                pc = operandPos; // after the last operand
                [opcode performWithOperands:operands];

                // store results
                for (int i = 0; i < opcode.storeArgs; i++) {
                    [self storeResult:opcode.rule type:resultTypes[i] address:resultAddrs[i] value:
                        operands[opcode.loadArgs + i]];
                }
            }
                break;

            case TFExecutionModeCString:
                [self nextCStringChar];
                break;

            case TFExecutionModeUnicodeString:
                [self nextUniStringChar];
                break;

            case TFExecutionModeNumber:
                [self nextDigit];
                break;

            case TFExecutionModeCompressedString:
                if (nativeDecodingTable != NULL) {
                    [nativeDecodingTable handleNextChar:self];
                } else {
                    [self nextCompressedChar];
                }
                break;

            case TFExecutionModeReturn:
                return result;
        }

    #if PROFILING
        cycles++;
    #endif
    }
    
    return result;
}

- (uint32_t)decodeLoadOperand:(TFOpcodeRule)rule type:(uint8_t)type operandPos:(uint *)operandPos {
    uint32_t address, value;
    switch (type) {
        case 0:
            //TODOWriteTrace("zero");
            value = 0;
            break;
        case 1:
            // TODO why cast to signed?
            value = (uint32_t)(int8_t)[image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("byte_" + value.ToString());
            break;;
        case 2:
            operandPos += 2;
            // TODO why cast to signed?
            value = (uint32_t)(int16_t)[image shortAtOffset:(*operandPos) - 2];
            //TODOWriteTrace("short_" + value.ToString());
            break;
        case 3:
            operandPos += 4;
            value = [image integerAtOffset:(*operandPos) - 4];
            //TODOWriteTrace("int_" + value.ToString());
            break;

        // case 4: unused

        case 5:
            address = [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("ptr");
            goto LoadIndirect;
        case 6:
            address = [image shortAtOffset:*operandPos];
            operandPos += 2;
            //TODOWriteTrace("ptr");
            goto LoadIndirect;
        case 7:
            address = [image integerAtOffset:*operandPos];
            operandPos += 4;
            //TODOWriteTrace("ptr");
        LoadIndirect:
            //TODOWriteTrace("_" + address.ToString() + "(");
            switch (rule) {
                case TFOpcodeRuleIndirect8Bit:
                    value = [image byteAtOffset:address];
                    break;
                case TFOpcodeRuleIndirect16Bit:
                    value = [image shortAtOffset:address];
                    break;
                default:
                    value = [image integerAtOffset:address];
                    break;
            }
            //TODOWriteTrace(value.ToString() + ")");
            break;

        case 8:
            if (sp <= fp + frameLen) {
                // TODO
                //throw new VMException("Stack underflow");
            }
            value = [self pop];
            //TODOWriteTrace("sp(" + value.ToString() + ")");
            break;

        case 9:
            address = [image byteAtOffset:(*operandPos)++];
            goto LoadLocal;
        case 10:
            address = [image shortAtOffset:*operandPos];
            operandPos += 2;
            goto LoadLocal;
        case 11:
            address = [image integerAtOffset:*operandPos];
            operandPos += 4;
        LoadLocal:
            //TODOWriteTrace("local_" + address.ToString() + "(");
            address += fp + localsPos;
            switch (rule) {
                case TFOpcodeRuleIndirect8Bit:
                    if (address >= fp + frameLen) {
                        //TODOthrow new VMException("Reading outside local storage bounds");
                    } else {
                        value = ((const uint8_t*)[stack bytes])[address];
                    }
                    break;
                case TFOpcodeRuleIndirect16Bit:
                    if (address + 1 >= fp + frameLen) {
                        //TODOthrow new VMException("Reading outside local storage bounds");
                    } else {
                        uint16_t shortValue;
                    
                        [stack getBytes:&shortValue range:NSMakeRange(address, sizeof(uint16_t))];

                        value = NSSwapBigShortToHost(shortValue);
                    }
                    break;
                default:
                    if (address + 3 >= fp + frameLen) {
                        //TODOthrow new VMException("Reading outside local storage bounds");
                    } else {
                        value = [self readFromStack:address];
                    }
                    break;
            }
            //TODOWriteTrace(value.ToString() + ")");
            break;

        // case 12: unused

        case 13:
            address = image.RAMStart + [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("ram");
            goto LoadIndirect;
        case 14:
            address = image.RAMStart + [image shortAtOffset:*operandPos];
            operandPos += 2;
            //TODOWriteTrace("ram");
            goto LoadIndirect;
        case 15:
            address = image.RAMStart + [image integerAtOffset:*operandPos];
            operandPos += 4;
            //TODOWriteTrace("ram");
            goto LoadIndirect;

        //TODOdefault:
            //TODOthrow new ArgumentException("Invalid operand type");
    }
    
    return value;
}

- (uint32_t)decodeStoreOperand:(TFOpcodeRule)rule type:(uint8_t)type operandPos:(uint32_t *)operandPos {
    uint32_t address = 0;
    switch (type) {
        case 0:
            // discard result
            //TODOWriteTrace("discard");
            break;

        // case 1..4: unused

        case 5:
            address = [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("ptr_" + address.ToString());
            break;
        case 6:
            address = [image shortAtOffset:*operandPos];
            (*operandPos) += 2;
            //TODOWriteTrace("ptr_" + address.ToString());
            break;
        case 7:
            address = [image integerAtOffset:*operandPos];
            (*operandPos) += 4;
            //TODOWriteTrace("ptr_" + address.ToString());
            break;

        // case 8: push onto stack
        case 8:
            // push onto stack
            //TODOWriteTrace("sp");
            return 0;

        case 9:
            address = [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("local_" + address.ToString());
            break;
        case 10:
            address = [image shortAtOffset:*operandPos];
            (*operandPos) += 2;
            //TODOWriteTrace("local_" + address.ToString());
            break;
        case 11:
            address = [image integerAtOffset:*operandPos];
            (*operandPos) += 4;
            //TODOWriteTrace("local_" + address.ToString());
            break;

        // case 12: unused

        case 13:
            address = image.RAMStart + [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("ram_" + (address - image.RamStart).ToString());
            break;
        case 14:
            address = image.RAMStart + [image shortAtOffset:*operandPos];
            (*operandPos) += 2;
            //TODOWriteTrace("ram_" + (address - image.RamStart).ToString());
            break;
        case 15:
            address = image.RAMStart + [image integerAtOffset:*operandPos];
            (*operandPos) += 4;
            //TODOWriteTrace("ram_" + (address - image.RamStart).ToString());
            break;

        //TODOdefault:
            //throw new ArgumentException("Invalid operand type");
    }
    return address;
}

- (void)storeResult:(TFOpcodeRule)rule type:(uint8_t)type address:(uint32_t)address value:(uint32_t)value {
    switch (type) {
        case 5:
        case 6:
        case 7:
        case 13:
        case 14:
        case 15:
            // write to memory
            switch (rule) {
                case TFOpcodeRuleIndirect8Bit:
                    [image setByte:(uint8_t)value atOffset:address];
                    break;
                case TFOpcodeRuleIndirect16Bit:
                    [image setShort:(uint16_t)value atOffset:address];
                    break;
                default:
                    [image setInteger:value atOffset:address];
                    break;
            }
            break;

        case 9:
        case 10:
        case 11:
            // write to local storage
            address += fp + localsPos;
            switch (rule)
            {
                case TFOpcodeRuleIndirect8Bit:
                    if (address >= fp + frameLen) {
                        //TODOthrow new VMException("Writing outside local storage bounds");
                    } else {
                        uint8_t byteValue = (uint8_t)value;
                        [stack replaceBytesInRange:NSMakeRange(address, sizeof(byteValue)) withBytes:&byteValue];
                    }
                    break;
                case TFOpcodeRuleIndirect16Bit:
                    if (address + 1 >= fp + frameLen) {
                        //TODOthrow new VMException("Writing outside local storage bounds");
                    } else {
                        uint16_t bigEndianShortValue = NSSwapHostShortToBig((uint16_t)value);
                        [stack replaceBytesInRange:NSMakeRange(address, sizeof(bigEndianShortValue)) withBytes:&bigEndianShortValue];
                    }
                    break;
                default:
                    if (address + 3 >= fp + frameLen) {
                        //TODOthrow new VMException("Writing outside local storage bounds");
                    } else {
                        [self setStackInteger:value atOffset:address];
                    }
                    break;
            }
            break;

        case 8:
            // push onto stack
            [self push:value];
            break;
    }
}

- (void)decodeDelayedStoreOperand:(uint8_t)type operandPos:(uint *)operandPos
                      resultArray:(uint32_t *)resultArray resultIndex:(int)resultIndex {
    switch (type) {
        case 0:
            // discard result
            resultArray[resultIndex] = TFGlulxStubStoreNULL;
            resultArray[resultIndex + 1] = 0;
            //TODOWriteTrace("discard");
            break;

        // case 1..4: unused

        case 5:
            resultArray[resultIndex] = TFGlulxStubStoreMemory;
            resultArray[resultIndex + 1] = [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("ptr_" + (resultArray[resultIndex + 1]).ToString());
            break;
        case 6:
            resultArray[resultIndex] = TFGlulxStubStoreMemory;
            resultArray[resultIndex + 1] = [image shortAtOffset:(*operandPos)];
            (*operandPos) += 2;
            //TODOWriteTrace("ptr_" + (resultArray[resultIndex + 1]).ToString());
            break;
        case 7:
            resultArray[resultIndex] = TFGlulxStubStoreMemory;
            resultArray[resultIndex + 1] = [image integerAtOffset:*operandPos];
            (*operandPos) += 4;
            //TODOWriteTrace("ptr_" + (resultArray[resultIndex + 1]).ToString());
            break;

        // case 8: push onto stack
        case 8:
            // push onto stack
            resultArray[resultIndex] = TFGlulxStubStoreStack;
            resultArray[resultIndex + 1] = 0;
            //TODOWriteTrace("sp");
            break;

        case 9:
            resultArray[resultIndex] = TFGlulxStubStoreLocal;
            resultArray[resultIndex + 1] = [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("local_" + (resultArray[resultIndex + 1]).ToString());
            break;
        case 10:
            resultArray[resultIndex] = TFGlulxStubStoreLocal;
            resultArray[resultIndex + 1] = [image shortAtOffset:*operandPos];
            (*operandPos) += 2;
            //TODOWriteTrace("local_" + (resultArray[resultIndex + 1]).ToString());
            break;
        case 11:
            resultArray[resultIndex] = TFGlulxStubStoreLocal;
            resultArray[resultIndex + 1] = [image integerAtOffset:*operandPos];
            (*operandPos) += 4;
            //TODOWriteTrace("local_" + (resultArray[resultIndex + 1]).ToString());
            break;

        // case 12: unused

        case 13:
            resultArray[resultIndex] = TFGlulxStubStoreMemory;
            resultArray[resultIndex + 1] = image.RAMStart + [image byteAtOffset:(*operandPos)++];
            //TODOWriteTrace("ram_" + (resultArray[resultIndex + 1] - image.RamStart).ToString());
            break;
        case 14:
            resultArray[resultIndex] = TFGlulxStubStoreMemory;
            resultArray[resultIndex + 1] = image.RAMStart + [image shortAtOffset:*operandPos];
            (*operandPos) += 2;
            //TODOWriteTrace("ram_" + (resultArray[resultIndex + 1] - image.RamStart).ToString());
            break;
        case 15:
            resultArray[resultIndex] = TFGlulxStubStoreMemory;
            resultArray[resultIndex + 1] = image.RAMStart + [image integerAtOffset:*operandPos];
            (*operandPos) += 4;
            //TODOWriteTrace("ram_" + (resultArray[resultIndex + 1] - image.RamStart).ToString());
            break;

        //TODOdefault:
            //throw new ArgumentException("Invalid operand type");
    }
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
    if ((options & TFSearchOptionsKeyIndirect) == 0) {
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
    if ((options & TFSearchOptionsReturnIndex) != 0) {
//        @throw [NSException exceptionWithName:@"TFException" reason:@"TFReturnIndexSearchOption may not be used with binarysearch" userInfo:nil];
    } else if (keySize > 4 && (options & TFSearchOptionsKeyIndirect) == 0) {
//        throw new VMException("KeyIndirect option must be used when searching for a >4 byte key");
    }

    uint32_t result = (options & TFSearchOptionsReturnIndex) == 0 ? 0 : 0xFFFFFFFF;
    uint32_t low = 0, high = numStructs;

    while (low < high)
    {
        uint32_t index = (low + high) / 2;
        int cmp = [self compareKeysWithQuery:key candidate:start + index * structSize + keyOffset keySize:keySize options:options];
        if (cmp == 0)
        {
            // found it
            if ((options & TFSearchOptionsReturnIndex) == 0)
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

    // opcodeDictionary will log on failure.
    opcodeDict = [[TFOpcode opcodeDictionary] retain];

    if (opcodeDict != nil) {
        result = YES;

        // Keys are sorted so, if there are errors, the order of the errors is deterministic. Errors may not be in order of original plist entries.
        for (NSNumber *opcodeNumber in [[opcodeDict allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
            TFOpcode *opcode = [opcodeDict objectForKey:opcodeNumber];
            if ([self respondsToSelector:opcode.selector] == NO) {
                NSLog(@"%@ has selector that is not implemented in %@.", opcode, [self class]);
                result = NO;
            }
        }
    }
    
    return result;
}

#pragma mark Standard methods

- (id)init {
    self = [super init];
    
    allowFiltering = YES;
    gameWantsFiltering = YES;

    
    veneer = [[TFVeneer alloc] init];
    
    return self;
}

- (void)dealloc {
    [self cleanup];

    [super dealloc];
}

@end
