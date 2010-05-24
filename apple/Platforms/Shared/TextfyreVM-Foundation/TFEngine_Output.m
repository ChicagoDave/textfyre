//
//  TFEngine_Output.m
//  TextfyreVM-Foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine_Output.h"

#import "GlulxConstants.h"
#import "TFArguments.h"
#import "TFEngine_Opcodes.h"
#import "TFOutputBuffer.h"
#import "TFStrNode.h"
#import "TFUlxImage.h"


@implementation TFEngine (Output)

- (void)sendCharToOutput:(uint32_t)character {
    if (outputSystem == TFIOSystemChannels) {
        // TODO: need to handle Unicode characters larger than 16 bits?
        [outputBuffer writeCharacter:(UniChar)character];
    }
}

- (void)sendStringToOutput:(NSString *)string {
    if (outputSystem == TFIOSystemChannels) {
        [outputBuffer writeString:string];
    }
}
/*
/// Sends the queued output to the <see cref="OutputReady"/> event handler.
- (void)DeliverOutput()
{
    if (OutputReady != null) {
        OutputReadyEventArgs args = new OutputReadyEventArgs();
        args.Package = outputBuffer.Flush();
        OutputReady(this, args);
    }
}
*/
- (void)selectOutputSystem:(TFIOSystem)number {
    switch (number) {
        case TFIOSystemNull:
        case TFIOSystemFilter:
        case TFIOSystemChannels:
            outputSystem = number;
            break;
        default: {
            //TODOthrow new VMException("Unrecognized output system " + number.ToString());
        }
    }
}

- (void)nextCStringChar {
    uint8_t ch = [image byteAtAddress:pc];
    pc++;

    if (ch == 0) {
        [self donePrinting];
        return;
    }

    if (outputSystem == TFIOSystemFilter) {
        [self performCallWithAddress:filterAddress args:[TFArguments argumentsWithArg:ch] destType:TFGlulxStubResumeCString destAddr:0 stubPC:pc];
    } else {
        [self sendCharToOutput:ch];
    }
}

- (void)nextUniStringChar {
    uint32_t ch = [image integerAtAddress:pc];
    pc += 4;

    if (ch == 0) {
        [self donePrinting];
        return;
    }

    if (outputSystem == TFIOSystemFilter) {
        [self performCallWithAddress:filterAddress args:[TFArguments argumentsWithArg:ch] destType:TFGlulxStubResumeUnicodeString destAddr:0 stubPC:pc];
    } else {
        [self sendCharToOutput:ch];
    }
}

#define kBufferStringLength     15

- (void)nextDigit {
    // Buffer needs to be longer than the number of digits of LONG_MAX
    char numberString[kBufferStringLength];
    
    snprintf(numberString, kBufferStringLength, "%lu", (unsigned long)pc);
    const size_t numberStringLength = strlen(numberString);

    if (printingDigit < numberStringLength) {
        if (outputSystem == TFIOSystemFilter) {
            [self performCallWithAddress:filterAddress args:[TFArguments argumentsWithArg:numberString[printingDigit]] destType:TFGlulxStubResumeNumber destAddr:printingDigit + 1 stubPC:pc];
        } else {
            // there's no reason to be here if we're not filtering output...
            // TODOSystem.Diagnostics.Debug.Assert(false);

            [self sendCharToOutput:numberString[printingDigit]];
            printingDigit++;
        }
    } else {
        [self donePrinting];
    }
}

- (BOOL)nextCompressedStringBit {
    BOOL result = ([image byteAtAddress:pc] & (1 << printingDigit)) != 0;

    printingDigit++;
    if (printingDigit == 8) {
        printingDigit = 0;
        pc++;
    }

    return result;
}

#pragma mark Native String Decoding Table

- (TFStrNode *)cacheDecodingTableNode:(uint32_t)node {
    TFStrNode *result = nil;

    if (node != 0) {
        const uint8_t nodeType = [image byteAtAddress:node++];
        
        TFStrNode *strNode = nil;

        switch (nodeType) {
            case TFGlulxHuffmanNodeEnd:
                strNode = [[TFEndStrNode alloc] init];
                break;

            case TFGlulxHuffmanNodeBranch: {
                TFStrNode *left = [self cacheDecodingTableNode:[image integerAtAddress:node]];
                TFStrNode *right = [self cacheDecodingTableNode:[image integerAtAddress:node + 4]];
            
                strNode = [[TFBranchStrNode alloc] initWithLeft:left right:right];
            }
                break;

            case TFGlulxHuffmanNodeChar:
                strNode = [[TFCharStrNode alloc] initWithCharacter:(char)[image byteAtAddress:node]];
                break;

            case TFGlulxHuffmanNodeUnichar:
                strNode = [[TFUniCharStrNode alloc] initWithUniChar:(UniChar)[image integerAtAddress:node]];
                break;

            case TFGlulxHuffmanNodeCStr:
                strNode = [[TFStringStrNode alloc] initWithAddress:node mode:TFExecutionModeCString string:[self readCString:node]];
                break;

            case TFGlulxHuffmanNodeUnistr:
                strNode = [[TFStringStrNode alloc] initWithAddress:node mode:TFExecutionModeUnicodeString string:[self readUniString:node]];
                break;

            case TFGlulxHuffmanNodeIndirect:
                strNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtAddress:node] doubleIndirect:NO argCount:0 argsAt:0];
                break;

            case TFGlulxHuffmanNodeIndirectArgs:
                strNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtAddress:node] doubleIndirect:NO argCount:[image integerAtAddress:node + 4] argsAt:node + 8];
                break;

            case TFGlulxHuffmanNodeDoubleIndirect:
                strNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtAddress:node] doubleIndirect:YES argCount:0 argsAt:0];
                break;

            case TFGlulxHuffmanNodeDoubleIndirectArgs:
                strNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtAddress:node] doubleIndirect:YES argCount:[image integerAtAddress:node + 4] argsAt:node + 8];
                break;

            /*TODOdefault:
                throw new VMException("Unrecognized compressed string node type " + nodeType.ToString());
            */
        }
        
        result = [strNode autorelease];
    }

    return result;
}

- (void)cacheDecodingTable {
    if (decodingTable == 0) {
        nativeDecodingTable = NULL;
        return;
    }

    const uint size = [image integerAtAddress:decodingTable + TFGlulxHuffmanTableSizeOffset];
    if (decodingTable + size - 1 >= image.RAMStart) {
        // If the table is in RAM, don't cache it. just verify it now and then process it directly from RAM when the time comes.
        nativeDecodingTable = NULL;
        [self verifyDecodingTable];
        return;
    }

    const uint32_t root = [image integerAtAddress:decodingTable + TFGlulxHuffmanRootNodeOffset];
    nativeDecodingTable = [self cacheDecodingTableNode:root];
}

- (NSString *)readCString:(uint32_t)address {
    NSMutableString *result = [NSMutableString string];

    uint8_t b = [image byteAtAddress:address];
    while (b != 0) {
        [result appendFormat:@"%c", b];
        b = [image byteAtAddress:++address];
    }

    return result;
}

- (NSString *)readUniString:(uint32_t)address {
    NSMutableString *result = [NSMutableString string];

    uint32_t ch = [image integerAtAddress:address];
    while (ch != 0) {
        // TODO, won't handle 4-byte unicode character, but original code didn't, either: cast it to char.
        [result appendFormat:@"%C", (UniChar)ch];
        address += 4;
        ch = [image integerAtAddress:address];
    }

    return result;
}

- (void)verifyDecodingTable {
    if (decodingTable == 0)
        return;
/*
    TODO
    Stack<uint> nodesToCheck = new Stack<uint>();

    uint rootNode = image.ReadInt32(decodingTable + GLULX_HUFF_ROOTNODE_OFFSET);
    nodesToCheck.Push(rootNode);

    bool foundBranch = false, foundEnd = false;

    while (nodesToCheck.Count > 0) {
        uint node = nodesToCheck.Pop();
        byte nodeType = image.ReadByte(node++);

        switch (nodeType) {
            case GLULX_HUFF_NODE_BRANCH:
                nodesToCheck.Push([image integerAtAddress:node]);       // left child
                nodesToCheck.Push(image.ReadInt32(node + 4));   // right child
                foundBranch = true;
                break;

            case GLULX_HUFF_NODE_END:
                foundEnd = true;
                break;

            case GLULX_HUFF_NODE_CHAR:
            case GLULX_HUFF_NODE_UNICHAR:
            case GLULX_HUFF_NODE_CSTR:
            case GLULX_HUFF_NODE_UNISTR:
            case GLULX_HUFF_NODE_INDIRECT:
            case GLULX_HUFF_NODE_INDIRECT_ARGS:
            case GLULX_HUFF_NODE_DBLINDIRECT:
            case GLULX_HUFF_NODE_DBLINDIRECT_ARGS:
                // OK
                break;

            default:
                throw new VMException("Unrecognized compressed string node type " + nodeType.ToString());
        }
    }

    if (!foundBranch)
        throw new VMException("String decoding table contains no branches");
    if (!foundEnd)
        throw new VMException("String decoding table contains no end markers");
    */
}

- (void)nextCompressedChar {
    uint32_t node = [image integerAtAddress:decodingTable + TFGlulxHuffmanRootNodeOffset];

    while (YES) {
        const uint8_t nodeType = [image byteAtAddress:node++];

        switch (nodeType) {
            case TFGlulxHuffmanNodeBranch:
                if ([self nextCompressedStringBit] == YES) {
                    node = [image integerAtAddress:node + 4]; // go right
                } else {
                    node = [image integerAtAddress:node]; // go left
                }
                break;

            case TFGlulxHuffmanNodeEnd:
                [self donePrinting];
                return;

            case TFGlulxHuffmanNodeChar:
            case TFGlulxHuffmanNodeUnichar: {
                const uint32_t singleChar = (nodeType == TFGlulxHuffmanNodeUnichar) ?
                    [image integerAtAddress:node] : [image byteAtAddress:node];
                if (outputSystem == TFIOSystemFilter) {
                    [self performCallWithAddress:filterAddress args:[TFArguments argumentsWithArg:singleChar] destType:TFGlulxStubResumeCompressedString destAddr:printingDigit stubPC:pc];
                } else {
                    [self sendCharToOutput:singleChar];
                }
            }
                return;

            case TFGlulxHuffmanNodeCStr:
                if (outputSystem == TFIOSystemFilter) {
                    [self pushCallStub:TFMakeCallStub(TFGlulxStubResumeCompressedString, printingDigit, pc, fp)];
                    pc = node;
                    execMode = TFExecutionModeCString;
                } else {
                    for (uint8_t ch = [image byteAtAddress:node]; ch != 0; ch = [image byteAtAddress:++node]) {
                        [self sendCharToOutput:ch];
                    }
                }
                return;

            case TFGlulxHuffmanNodeUnistr:
                if (outputSystem == TFIOSystemFilter) {
                    [self pushCallStub:TFMakeCallStub(TFGlulxStubResumeUnicodeString, printingDigit, pc, fp)];
                    pc = node;
                    execMode = TFExecutionModeUnicodeString;
                } else {
                    for (uint32_t ch = [image integerAtAddress:node]; ch != 0; node += 4, ch = [image integerAtAddress:node]) {
                        [self sendCharToOutput:ch];
                    }
                }
                return;

            case TFGlulxHuffmanNodeIndirect:
                [self printIndirect:[image integerAtAddress:node] argCount:0 argsAt:0];
                return;

            case TFGlulxHuffmanNodeIndirectArgs:
                [self printIndirect:[image integerAtAddress:node] argCount:[image integerAtAddress:node + 4] argsAt:node + 8];
                return;

            case TFGlulxHuffmanNodeDoubleIndirect:
                [self printIndirect:[image integerAtAddress:[image integerAtAddress:node]] argCount:0 argsAt:0];
                return;

            case TFGlulxHuffmanNodeDoubleIndirectArgs:
                [self printIndirect:[image integerAtAddress:[image integerAtAddress:node]] argCount:[image integerAtAddress:node + 4]argsAt:node + 8];
                return;

            /*TODOdefault:
                throw new VMException("Unrecognized compressed string node type " + nodeType.ToString());
            */
        }
    }
}

- (void)printIndirect:(uint32_t)address argCount:(uint32_t)argCount argsAt:(uint32_t)argsAt {
    const uint8_t type = [image byteAtAddress:address];

    switch (type) {
        case 0xC0:
        case 0xC1: {
            TFArguments *args = [TFArguments argumentsWithCount:argCount];
            for (uint32_t i = 0; i < argCount; ++i) {
                [args setArg:[image integerAtAddress:argsAt + 4 * i] atIndex:i];
            }
            [self performCallWithAddress:address args:args destType:TFGlulxStubResumeCompressedString destAddr:printingDigit stubPC:pc];
        }
            break;

        case 0xE0:
            if (outputSystem == TFIOSystemFilter) {
                [self pushCallStub:TFMakeCallStub(TFGlulxStubResumeCompressedString, printingDigit, pc, fp) ];
                execMode = TFExecutionModeCString;
                pc = address + 1;
            } else {
                ++address;
                for (uint8_t ch = [image byteAtAddress:address]; ch != 0; ch = [image byteAtAddress:++address]) {
                    [self sendCharToOutput:ch];
                }
            }
            break;

        case 0xE1:
            [self pushCallStub:TFMakeCallStub(TFGlulxStubResumeCompressedString, printingDigit, pc, fp)];
            execMode = TFExecutionModeCompressedString;
            pc = address + 1;
            printingDigit = 0;
            break;

        case 0xE2:
            if (outputSystem == TFIOSystemFilter) {
                [self pushCallStub:TFMakeCallStub(TFGlulxStubResumeCompressedString, printingDigit, pc, fp)];
                execMode = TFExecutionModeUnicodeString;
                pc = address + 4;
            } else {
                address += 4;
                for (uint32_t ch = [image integerAtAddress:address]; ch != 0; address += 4, ch = [image integerAtAddress:address]) {
                    [self sendCharToOutput:ch];
                }
            }
            break;

        /*TODOdefault:
            throw new VMException(string.Format("Invalid type for indirect printing: {0:X}h", type));
        */
    }
}

- (void)donePrinting {
    [self resumeFromCallStub:0];
}

@end
