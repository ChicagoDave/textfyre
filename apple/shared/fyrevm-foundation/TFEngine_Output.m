//
//  TFEngine_Output.m
//  fyrevm-foundation
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
        [outputBuffer writeCharacter:(char)character];
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
    if (OutputReady != null)
    {
        OutputReadyEventArgs args = new OutputReadyEventArgs();
        args.Package = outputBuffer.Flush();
        OutputReady(this, args);
    }
}

- (void)SelectOutputSystem(uint number, uint rock)
{
    switch (number)
    {
        case 0:
            outputSystem = IOSystem.Null;
            break;
        case 1:
            outputSystem = IOSystem.Filter;
            filterAddress = rock;
            break;
        case 20: // T is the 20th letter
            outputSystem = IOSystem.Channels;
            break;
        default:
            throw new VMException("Unrecognized output system " + number.ToString());
    }
}
*/
- (void)nextCStringChar {
    uint8_t ch = [image byteAtOffset:pc];
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
    uint32_t ch = [image integerAtOffset:pc];
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
    BOOL result = ([image byteAtOffset:pc] & (1 << printingDigit)) != 0;

    printingDigit++;
    if (printingDigit == 8)
    {
        printingDigit = 0;
        pc++;
    }

    return result;
}

#pragma mark Native String Decoding Table

- (void)cacheDecodingTable {
    if (decodingTable == 0) {
        nativeDecodingTable = NULL;
        return;
    }

    uint size = [image integerAtOffset:decodingTable + TFGlulxHuffmanTableSizeOffset];
    if (decodingTable + size - 1 >= image.RAMStart) {
        // If the table is in RAM, don't cache it. just verify it now and then process it directly from RAM when the time comes.
        nativeDecodingTable = NULL;
        [self verifyDecodingTable];
        return;
    }

    uint32_t root = [image integerAtOffset:decodingTable + TFGlulxHuffmanRootNodeOffset];
    nativeDecodingTable = [self cacheDecodingTableNode:root];
}

- (TFStrNode *)cacheDecodingTableNode:(uint32_t)node {
    TFStrNode *result = nil;

    if (node != 0) {
        uint8_t nodeType = [image byteAtOffset:node++];
        
        TFStrNode *allocedNode = nil;

        switch (nodeType) {
            case TFGlulxHuffmanNodeEnd:
                allocedNode = [[TFEndStrNode alloc] init];
                break;

            case TFGlulxHuffmanNodeBranch: {
                TFStrNode *left = [self cacheDecodingTableNode:[image integerAtOffset:node]];
                TFStrNode *right = [self cacheDecodingTableNode:[image integerAtOffset:node + 4]];
            
                allocedNode = [[TFBranchStrNode alloc] initWithLeft:left right:right];
            }
                break;

            case TFGlulxHuffmanNodeChar:
                allocedNode = [[TFCharStrNode alloc] initWithCharacter:(char)[image byteAtOffset:node]];
                break;

            case TFGlulxHuffmanNodeUnichar:
                allocedNode = [[TFUniCharStrNode alloc] initWithUniChar:(UniChar)[image integerAtOffset:node]];
                break;

            case TFGlulxHuffmanNodeCStr:
                allocedNode = [[TFStringStrNode alloc] initWithAddress:node mode:TFExecutionModeCString string:[self readCString:node]];
                break;

            case TFGlulxHuffmanNodeUnistr:
                allocedNode = [[TFStringStrNode alloc] initWithAddress:node mode:TFExecutionModeUnicodeString string:[self readUniString:node]];
                break;

            case TFGlulxHuffmanNodeIndirect:
                allocedNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtOffset:node] doubleIndirect:NO argCount:0 argsAt:0];
                break;

            case TFGlulxHuffmanNodeIndirectArgs:
                allocedNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtOffset:node] doubleIndirect:NO argCount:[image integerAtOffset:node + 4] argsAt:node + 8];
                break;

            case TFGlulxHuffmanNodeDBLIndirect:
                allocedNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtOffset:node] doubleIndirect:YES argCount:0 argsAt:0];
                break;

            case TFGlulxHuffmanNodeDBLIndirectArgs:
                allocedNode = [[TFIndirectStrNode alloc] initWithAddress:[image integerAtOffset:node] doubleIndirect:YES argCount:[image integerAtOffset:node + 4] argsAt:node + 8];
                break;

            /*TODOdefault:
                throw new VMException("Unrecognized compressed string node type " + nodeType.ToString());
            */
        }
        
        result = [allocedNode autorelease];
    }

    return result;
}

- (NSString *)readCString:(uint32_t)address {
    NSMutableString *result = [NSMutableString string];

    uint8_t b = [image byteAtOffset:address];
    while (b != 0) {
        [result appendFormat:@"%c", b];
        b = [image byteAtOffset:++address];
    }

    return result;
}

- (NSString *)readUniString:(uint32_t)address {
    NSMutableString *result = [NSMutableString string];

    uint32_t ch = [image integerAtOffset:address];
    while (ch != 0) {
        [result appendFormat:@"%C", (UniChar)ch];
        address += 4;
        ch = [image integerAtOffset:address];
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

    while (nodesToCheck.Count > 0)
    {
        uint node = nodesToCheck.Pop();
        byte nodeType = image.ReadByte(node++);

        switch (nodeType)
        {
            case GLULX_HUFF_NODE_BRANCH:
                nodesToCheck.Push([image integerAtOffset:node]);       // left child
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
    uint32_t node = [image integerAtOffset:decodingTable + TFGlulxHuffmanRootNodeOffset];

    while (YES) {
        uint8_t nodeType = [image byteAtOffset:node++];

        switch (nodeType) {
            case TFGlulxHuffmanNodeBranch:
                if ([self nextCompressedStringBit] == YES) {
                    node = [image integerAtOffset:node + 4]; // go right
                } else {
                    node = [image integerAtOffset:node]; // go left
                }
                break;

            case TFGlulxHuffmanNodeEnd:
                [self donePrinting];
                return;

            case TFGlulxHuffmanNodeChar:
            case TFGlulxHuffmanNodeUnichar: {
                uint32_t singleChar = (nodeType == TFGlulxHuffmanNodeUnichar) ?
                    [image integerAtOffset:node] : [image byteAtOffset:node];
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
                    for (uint8_t ch = [image byteAtOffset:node]; ch != 0; ch = [image byteAtOffset:++node]) {
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
                    for (uint32_t ch = [image integerAtOffset:node]; ch != 0; node += 4, ch = [image integerAtOffset:node]) {
                        [self sendCharToOutput:ch];
                    }
                }
                return;

            case TFGlulxHuffmanNodeIndirect:
                [self printIndirect:[image integerAtOffset:node] argCount:0 argsAt:0];
                return;

            case TFGlulxHuffmanNodeIndirectArgs:
                [self printIndirect:[image integerAtOffset:node] argCount:[image integerAtOffset:node + 4]argsAt:node + 8];
                return;

            case TFGlulxHuffmanNodeDBLIndirect:
                [self printIndirect:[image integerAtOffset:[image integerAtOffset:node]] argCount:0 argsAt:0];
                return;

            case TFGlulxHuffmanNodeDBLIndirectArgs:
                [self printIndirect:[image integerAtOffset:[image integerAtOffset:node]] argCount:[image integerAtOffset:node + 4]argsAt:node + 8];
                return;

            /*TODOdefault:
                throw new VMException("Unrecognized compressed string node type " + nodeType.ToString());
            */
        }
    }
}

- (void)printIndirect:(uint32_t)address argCount:(uint32_t)argCount argsAt:(uint32_t)argsAt {
    uint8_t type = [image byteAtOffset:address];

    switch (type) {
        case 0xC0:
        case 0xC1: {
            TFArguments *args = [TFArguments argumentsWithCount:argCount];
            for (uint32_t i = 0; i < argCount; i++) {
                [args setArg:[image integerAtOffset:argsAt + 4 * i] atIndex:i];
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
                address++;
                for (uint8_t ch = [image byteAtOffset:address]; ch != 0; ch = [image byteAtOffset:++address]) {
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
                for (uint32_t ch = [image integerAtOffset:address]; ch != 0; address += 4, ch = [image integerAtOffset:address]) {
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
