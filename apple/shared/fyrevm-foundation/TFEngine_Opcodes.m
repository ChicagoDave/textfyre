//
//  TFEngine_Opcodes.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFEngine_Opcodes.h"

#import "TFUlxImage.h"
#import "TFVeneer.h"
#import "TFArguments.h"


@implementation TFEngine (Opcodes)

// opcode: 0x00
// name: nop
// loadArgs: 0
- (void)op_nop:(TFArguments *)args
{
    // do nothing!
}

#pragma mark Arithmetic

// opcode: 0x10
// name: add
// loadArgs: 2
// storeArgs: 1
- (void)op_add:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] + [args argAtIndex:1] atIndex:2];
}

// opcode: 0x11
// name: sub
// loadArgs: 2
// storeArgs: 1
- (void)op_sub:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] - [args argAtIndex:1] atIndex:2];
}

// opcode: 0x12
// name: mul
// loadArgs: 2
// storeArgs: 1
- (void)op_mul:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] * [args argAtIndex:1] atIndex:2];
}

// opcode: 0x13
// name: div
// loadArgs: 2
// storeArgs: 1
- (void)op_div:(TFArguments *)args
{
    [args setArg:(uint32_t)((int)[args argAtIndex:0] / (int)[args argAtIndex:1]) atIndex:2];
}

// opcode: 0x14
// name: mod
// loadArgs: 2
// storeArgs: 1
- (void)op_mod:(TFArguments *)args
{
    [args setArg:(uint32_t)((int)[args argAtIndex:0] % (int)[args argAtIndex:1]) atIndex:2];
}

// opcode: 0x15
// name: neg
// loadArgs: 1
// storeArgs: 1
- (void)op_neg:(TFArguments *)args
{
    [args setArg:(uint32_t)(-(int)[args argAtIndex:0]) atIndex:1];
}

// opcode: 0x18
// name: bitand
// loadArgs: 2
// storeArgs: 1
- (void)op_bitand:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] & [args argAtIndex:1] atIndex:2];
}

// opcode: 0x19
// name: bitor
// loadArgs: 2
// storeArgs: 1
- (void)op_bitor:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] | [args argAtIndex:1] atIndex:2];
}

// opcode: 0x1A
// name: bitxor
// loadArgs: 2
// storeArgs: 1
- (void)op_bitxor:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] ^ [args argAtIndex:1] atIndex:2];
}

// opcode: 0x1B
// name: bitnot
// loadArgs: 1
// storeArgs: 1
- (void)op_bitnot:(TFArguments *)args
{
    [args setArg:~[args argAtIndex:0] atIndex:1];
}

// opcode: 0x1C
// name: shiftl
// loadArgs: 2
// storeArgs: 1
- (void)op_shiftl:(TFArguments *)args
{
    if ([args argAtIndex:1] >= 32)
        [args setArg:0 atIndex:2];
    else
        [args setArg:[args argAtIndex:0] << (int)[args argAtIndex:1] atIndex:2];
}

// opcode: 0x1D
// name: sshiftr
// loadArgs: 2
// storeArgs: 1
- (void)op_sshiftr:(TFArguments *)args
{
    if ([args argAtIndex:1] >= 32)
        [args setArg:(([args argAtIndex:0] & 0x80000000) == 0) ? 0 : 0xFFFFFFFF atIndex:2];
    else
        [args setArg:(uint32_t)((int)[args argAtIndex:0] >> (int)[args argAtIndex:1]) atIndex:2];
}

// opcode: 0x1E
// name: ushiftr
// loadArgs: 2
// storeArgs: 1
- (void)op_ushiftr:(TFArguments *)args
{
    if ([args argAtIndex:1] >= 32)
        [args setArg:0 atIndex:2];
    else
        [args setArg:[args argAtIndex:0] >> (int)[args argAtIndex:1] atIndex:2];
}

#pragma mark Branching

// opcode: 0x20
// name: jump
// loadArgs: 1
- (void)op_jump:(TFArguments *)args
{
    [self takeBranch:[args argAtIndex:0]];
}

// opcode: 0x22
// name: jz
// loadArgs: 2
- (void)op_jz:(TFArguments *)args
{
    if ([args argAtIndex:0] == 0)
        [self takeBranch:[args argAtIndex:1]];
}

// opcode: 0x23
// name: jnz
// loadArgs: 2
- (void)op_jnz:(TFArguments *)args
{
    if ([args argAtIndex:0] != 0)
        [self takeBranch:[args argAtIndex:1]];
}

// opcode: 0x24
// name: jeq
// loadArgs: 3
- (void)op_jeq:(TFArguments *)args
{
    if ([args argAtIndex:0] == [args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x25
// name: jne
// loadArgs: 3
- (void)op_jne:(TFArguments *)args
{
    if ([args argAtIndex:0] != [args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x26
// name: jlt
// loadArgs: 3
- (void)op_jlt:(TFArguments *)args
{
    if ((int)[args argAtIndex:0] < (int)[args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x27
// name: jge
// loadArgs: 3
- (void)op_jge:(TFArguments *)args
{
    if ((int)[args argAtIndex:0] >= (int)[args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x28
// name: jgt
// loadArgs: 3
- (void)op_jgt:(TFArguments *)args
{
    if ((int)[args argAtIndex:0] > (int)[args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x29
// name: jle
// loadArgs: 3
- (void)op_jle:(TFArguments *)args
{
    if ((int)[args argAtIndex:0] <= (int)[args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x2A
// name: jltu
// loadArgs: 3
- (void)op_jltu:(TFArguments *)args
{
    if ([args argAtIndex:0] < [args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x2B
// name: jgeu
// loadArgs: 3
- (void)op_jgeu:(TFArguments *)args
{
    if ([args argAtIndex:0] >= [args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x2C
// name: jgtu
// loadArgs: 3
- (void)op_jgtu:(TFArguments *)args
{
    if ([args argAtIndex:0] > [args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x2D
// name: jleu
// loadArgs: 3
- (void)op_jleu:(TFArguments *)args
{
    if ([args argAtIndex:0] <= [args argAtIndex:1])
        [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x104
// name: jumpabs
// loadArgs: 1
- (void)op_jumpabs:(TFArguments *)args
{
    pc = [args argAtIndex:0];
}

#pragma mark Functions

// opcode: 0x30
// name: call
// loadArgs: 2
// rule: DelayedStore
- (void)op_call:(TFArguments *)args
{
    int count = (int)[args argAtIndex:1];
    
    TFArguments *funcargs = [TFArguments argumentsWithCount:count];

    for (int i = 0; i < count; i++) {
        [funcargs setArg:[self pop] atIndex:i];
    }

    [self performCallWithAddress:[args argAtIndex:0] args:funcargs destType:[args argAtIndex:2] destAddr:[args argAtIndex:3]];
}

// opcode: 0x160
// name: callf
// loadArgs: 1
// rule: DelayedStore
- (void)op_callf:(TFArguments *)args
{
    [self performCallWithAddress:[args argAtIndex:0] args:NULL destType:[args argAtIndex:1] destAddr:[args argAtIndex:2]];
}

// opcode: 0x161
// name: callfi
// loadArgs: 2
// rule: DelayedStore
- (void)op_callfi:(TFArguments *)args
{
    TFArguments *funcargs1 = [TFArguments argumentsWithArg:[args argAtIndex:1]];

    [self performCallWithAddress:[args argAtIndex:0] args:funcargs1 destType:[args argAtIndex:2] destAddr:[args argAtIndex:3]];
}

// opcode: 0x162
// name: callfii
// loadArgs: 3
// rule: DelayedStore
- (void)op_callfii:(TFArguments *)args
{
    TFArguments *funcargs2 = [TFArguments argumentsWithArg:[args argAtIndex:1] arg:[args argAtIndex:2]];

    [self performCallWithAddress:[args argAtIndex:0] args:funcargs2 destType:[args argAtIndex:3] destAddr:[args argAtIndex:4]];
}

// opcode: 0x163
// name: callfiii
// loadArgs: 4
// rule: DelayedStore
- (void)op_callfiii:(TFArguments *)args
{
    TFArguments *funcargs3 = [TFArguments argumentsWithArg:[args argAtIndex:1] arg:[args argAtIndex:2] arg:[args argAtIndex:3]];

    [self performCallWithAddress:[args argAtIndex:0] args:funcargs3 destType:[args argAtIndex:4] destAddr:[args argAtIndex:5]];
}

- (void)performCallWithAddress:(uint32_t)address args:(TFArguments *)args destType:(uint32_t)destType destAddr:(uint32_t)destAddr
{
    [self performCallWithAddress:address args:args destType:destType destAddr:destAddr stubPC:pc];
}

- (void)performCallWithAddress:(uint32_t)address args:(TFArguments *)args destType:(uint32_t)destType destAddr:(uint32_t)destAddr stubPC:(uint32_t)stubPC
{
    [self performCallWithAddress:address args:args destType:destType destAddr:destAddr stubPC:stubPC tailCall:NO];
}

- (void)performCallWithAddress:(uint32_t)address args:(TFArguments *)args destType:(uint32_t)destType destAddr:(uint32_t)destAddr stubPC:(uint32_t)stubPC tailCall:(BOOL)tailCall
{
    uint32_t result;
    if ([veneer interceptCallAtAddress:address args:args result:&result]) {
        [self performDelayedStoreOfType:destType address:destAddr value:result];
        return;
    }

    if (tailCall) {
        // pop the current frame and use the call stub below it
        sp = fp;
    } else {
        // use a new call stub
        [self pushCallStub:TFMakeCallStub(destType, destAddr, stubPC, fp)];
    }

    uint8_t type = [image byteAtOffset:address];
    if (type == 0xC0) {
        // arguments are passed in on the stack
        [self enterFunctionAtAddress:address];
        if (args == NULL) {
            [self push:0];
        } else {
            for (int i = args.count - 1; i >= 0; i--) {
                [self push:[args argAtIndex:i]];
            }
            [self push:(uint32_t)args.count];
        }
    } else if (type == 0xC1) {
        // arguments are passed in local storage
        [self enterFunctionAtAddress:address args:args];
    } else {
//        throw new VMException(string.Format("Invalid function type {0:X}h", type));
    }
}

// opcode: 0x31
// name: return
// loadArgs: 1
- (void)op_return:(TFArguments *)args {
    [self leaveFunction:[args argAtIndex:0]];
}

// opcode: 0x32
// name: catch
// loadArgs: 0
// rule: Catch
- (void)op_catch:(TFArguments *)args
{
    [self pushCallStub:TFMakeCallStub([args argAtIndex:0], [args argAtIndex:1], pc, fp)];
    // the catch token is the value of sp after pushing that stub
    [self performDelayedStoreOfType:[args argAtIndex:0] address:[args argAtIndex:1] value:sp];
    [self takeBranch:[args argAtIndex:2]];
}

// opcode: 0x33
// name: throw
// loadArgs: 2
- (void)op_throw:(TFArguments *)args
{
    if ([args argAtIndex:1] > sp) {
//        throw new VMException("Invalid catch token");
    }

    // pop the stack back down to the stub pushed by catch
    sp = [args argAtIndex:1];

    // restore from the stub
    TFCallStub stub = [self popCallStub];
    pc = stub.pc;
    fp = stub.framePtr;
    frameLen = [self readFromStack:fp];
    localsPos = [self readFromStack:fp + 4];

    // store the thrown value and resume after the catch opcode
    [self performDelayedStoreOfType:stub.destType address:stub.destAddr value:[args argAtIndex:0]];
}

// opcode: 0x34
// name: tailcall
// loadArgs: 2
- (void)op_tailcall:(TFArguments *)args
{
    uint32_t count = [args argAtIndex:1];
    TFArguments *funcargs = [TFArguments argumentsWithCount:count];

    for (uint32_t i = 0; i < count; i++) {
        [funcargs setArg:[self pop] atIndex:i];
    }

    [self performCallWithAddress:[args argAtIndex:0] args:funcargs destType:0 destAddr:0 stubPC:0 tailCall:YES];
}

#pragma mark Variables and Arrays

// opcode: 0x40
// name: copy
// loadArgs: 1
// storeArgs: 1
- (void)op_copy:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] atIndex:1];
}

// opcode: 0x41
// name: copys
// loadArgs: 1
// storeArgs: 1
// rule: Indirect16Bit
- (void)op_copys:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] atIndex:1];
}

// opcode: 0x42
// name: copyb
// loadArgs: 1
// storeArgs: 1
// rule: Indirect8Bit
- (void)op_copyb:(TFArguments *)args
{
    [args setArg:[args argAtIndex:0] atIndex:1];
}

// opcode: 0x44
// name: sexs
// loadArgs: 1
// storeArgs: 1
/* Sign-extend a value, considered as a 16-bit value. If the value's 8000 bit is set, the upper 16 bits are all set; otherwise, the upper 16 bits are all cleared.
 */
- (void)op_sexs:(TFArguments *)args
{
    // TODO will these casts really do what the documentation says they'll do?
    [args setArg:(uint32_t)(int)(short)[args argAtIndex:0] atIndex:1];
}

// opcode: 0x45
// name: sexb
// loadArgs: 1
// storeArgs: 1
/*! Sign-extend a value, considered as an 8-bit value. If the value's 80 bit is set, the upper 24 bits are all set; otherwise, the upper 24 bits are all cleared.
 */
- (void)op_sexb:(TFArguments *)args
{
    // TODO will these casts really do what the documentation says they'll do?
    [args setArg:(uint32_t)(int)(int8_t)[args argAtIndex:0] atIndex:1];
}

// opcode: 0x48
// name: aload
// loadArgs: 2
// storeArgs: 1
- (void)op_aload:(TFArguments *)args
{
    [args setArg:[image integerAtOffset:[args argAtIndex:0] + 4 * [args argAtIndex:1]] atIndex:2];
}

// opcode: 0x49
// name: aloads
// loadArgs: 2
// storeArgs: 1
- (void)op_aloads:(TFArguments *)args
{
    [args setArg:[image shortAtOffset:[args argAtIndex:0] + 2 * [args argAtIndex:1]] atIndex:2];
}

// opcode: 0x4A
// name: aloadb
// loadArgs: 2
// storeArgs: 1
- (void)op_aloadb:(TFArguments *)args
{
    [args setArg:[image byteAtOffset:[args argAtIndex:0] + [args argAtIndex:1]] atIndex:2];
}

// opcode: 0x4B
// name: aloadbit
// loadArgs: 2
// storeArgs: 1
- (void)op_aloadbit:(TFArguments *)args
{
    uint32_t address = (uint32_t)([args argAtIndex:0] + ((int)[args argAtIndex:1]) / 8);
    uint8_t bit = (uint8_t)(((int)[args argAtIndex:1]) % 8);

    uint8_t value = [image byteAtOffset:address];
    [args setArg:(value & (1 << bit)) == 0 ? (uint32_t)0 : (uint32_t)1 atIndex:2];
}

// opcode: 0x4C
// name: astore
// loadArgs: 3
- (void)op_astore:(TFArguments *)args
{
    [image setInteger:[args argAtIndex:2] atOffset:[args argAtIndex:0] + 4 * [args argAtIndex:1]];
}

// opcode: 0x4D
// name: astores
// loadArgs: 3
- (void)op_astores:(TFArguments *)args
{
    [image setShort:(uint16_t)[args argAtIndex:2] atOffset:[args argAtIndex:0] + 2 * [args argAtIndex:1]];
}

// opcode: 0x4E
// name: astoreb
// loadArgs: 3
- (void)op_astoreb:(TFArguments *)args
{
    [image setByte:(uint8_t)[args argAtIndex:2] atOffset:[args argAtIndex:0] + [args argAtIndex:1]];
}

// opcode: 0x4F
// name: astorebit
// loadArgs: 3
- (void)op_astorebit:(TFArguments *)args
{
    uint32_t address = (uint32_t)([args argAtIndex:0] + ((int)[args argAtIndex:1]) / 8);
    uint8_t bit = (uint8_t)(((int)[args argAtIndex:1]) % 8);

    uint8_t value = [image byteAtOffset:address];
    if ([args argAtIndex:2] == 0) {
        value &= (uint8_t)(~(1 << bit));
    } else {
        value |= (uint8_t)(1 << bit);
    }
    [image setByte:value atOffset:address];
}

#pragma mark Output

// opcode: 0x70
// name: streamchar
// loadArgs: 1
- (void)op_streamchar:(TFArguments *)args
{
    StreamCharCore((byte)[args argAtIndex:0]];
}

// opcode: 0x73
// name: streamunichar
// loadArgs: 1
- (void)op_streamunichar:(TFArguments *)args
{
    StreamCharCore([args argAtIndex:0]];
}

- (void)StreamCharCore(uint32_t value)
{
    if (outputSystem == IOSystem.Filter)
    {
        [self performCallWithAddress:filterAddress, new uint32_t *{ value }, TFGlulxStubStoreNULL, 0);
    }
    else
    {
        SendCharToOutput(value);
    }
}

// opcode: 0x71
// name: streamnum
// loadArgs: 1
- (void)op_streamnum:(TFArguments *)args
{
    if (outputSystem == IOSystem.Filter)
    {
        PushCallStub(new CallStub(GLULX_STUB_RESUME_FUNC, 0, pc, fp));
        string num = ((int)[args argAtIndex:0]).ToString();
        [self performCallWithAddress:filterAddress, new uint32_t *{ (uint32_t)num[0] },
            GLULX_STUB_RESUME_NUMBER, 1, [args argAtIndex:0]];
    }
    else
    {
        string num = ((int)[args argAtIndex:0]).ToString();
        SendStringToOutput(num);
    }
}

// opcode: 0x72
// name: streamstr
// loadArgs: 1
- (void)op_streamstr:(TFArguments *)args
{
    if (outputSystem == IOSystem.Null)
        return;

    uint32_t address = [args argAtIndex:0];
    byte type = image.ReadByte(address);

    // for retrying a compressed string after we discover it needs a call stub
    byte savedDigit = 0;
    StrNode savedNode = null;

    // if we're not using the userland output filter, and the string is uncompressed (or contains no indirect references), we can just print it right here.
    if (outputSystem != IOSystem.Filter)
    {
        switch (type)
        {
            case 0xE0:
                // C string
                SendStringToOutput(ReadCString(address + 1));
                return;
            case 0xE2:
                // Unicode string
                SendStringToOutput(ReadUniString(address + 4));
                return;
            case 0xE1:
                // compressed string
                if (nativeDecodingTable != null)
                {
                    uint32_t oldPC = pc;

                    pc = address + 1;
                    printingDigit = 0;

                    StrNode node = nativeDecodingTable.GetHandlingNode(this);
                    while (!node.NeedsCallStub)
                    {
                        if (node.IsTerminator)
                        {
                            pc = oldPC;
                            return;
                        }

                        node.HandleNextChar(this);

                        node = nativeDecodingTable.GetHandlingNode(this);
                    }

                    savedDigit = printingDigit;
                    savedNode = node;
                    address = pc - 1;
                    pc = oldPC;
                }
                break;
        }
    }

    // can't decompress anything without a decoding table
    if (type == 0xE1 && decodingTable == 0)
        throw new VMException("No string decoding table is set");

    // otherwise, we have to push a call stub and let the main interpreter loop take care of printing the string.
    PushCallStub(new CallStub(GLULX_STUB_RESUME_FUNC, 0, pc, fp));

    switch (type)
    {
        case 0xE0:
            execMode = ExecutionMode.CString;
            pc = address + 1;
            break;
        case 0xE1:
            execMode = ExecutionMode.CompressedString;
            pc = address + 1;
            printingDigit = savedDigit;
            // this won't read a bit, since savedNode can't be a branch...
            if (savedNode != null)
                savedNode.HandleNextChar(this);
            break;
        case 0xE2:
            execMode = ExecutionMode.UnicodeString;
            pc = address + 4;
            break;
        default:
            throw new VMException(string.Format("Invalid string type {0:X}h", type));
    }
}

// opcode: 0x130
// name: glk
// loadArgs: 2
// storeArgs: 1
- (void)op_glk:(TFArguments *)args
{
    // not really supported, just clear the stack
    for (uint32_t i = 0; i < [args argAtIndex:1]; i++)
        Pop();
    [args setArg:0 atIndex:2];
}

// opcode: 0x140
// name: getstringtbl
// loadArgs: 0
// storeArgs: 1
- (void)op_getstringtbl:(TFArguments *)args
{
    [args setArg:decodingTable atIndex:0];
}

// opcode: 0x141
// name: setstringtbl
// loadArgs: 1
- (void)op_setstringtbl:(TFArguments *)args
{
    decodingTable = [args argAtIndex:0];
    CacheDecodingTable();
}

// opcode: 0x148
// name: getiosys
// loadArgs: 0
// storeArgs: 2
- (void)op_getiosys:(TFArguments *)args
{
    switch (outputSystem)
    {
        case IOSystem.Null:
            [args setArg:0 atIndex:0];
            [args setArg:0 atIndex:1];
            break;

        case IOSystem.Filter:
            [args setArg:1 atIndex:0];
            [args setArg:filterAddress atIndex:1];
            break;

        case IOSystem.Channels:
            [args setArg:20 atIndex:0];
            [args setArg:0 atIndex:1];
            break;
    }
}

// opcode: 0x149
// name: setiosys
// loadArgs: 2
// storeArgs: 0
- (void)op_setiosys:(TFArguments *)args
{
    SelectOutputSystem([args argAtIndex:0], [args argAtIndex:1]];
}

#pragma mark Memory Management

// opcode: 0x102
// name: getmemsize
// loadArgs: 0
// storeArgs: 1
- (void)op_getmemsize:(TFArguments *)args
{
    [args setArg:image.endMemory atIndex:0];
}

// opcode: 0x103
// name: setmemsize
// loadArgs: 1
// storeArgs: 1
- (void)op_setmemsize:(TFArguments *)args
{
    if (heap != null)
        throw new VMException("setmemsize is not allowed while the heap is active");

    try
    {
        image.endMemory = [args argAtIndex:0];
        [args setArg:0 atIndex:1];
    }
    catch
    {
        [args setArg:1 atIndex:1];
    }
}

// opcode: 0x170
// name: mzero
// loadArgs: 2
- (void)op_mzero:(TFArguments *)args
{
    for (uint32_t i = 0; i < [args argAtIndex:0]; i++)
        image.WriteByte([args argAtIndex:1] + i, 0);
}

// opcode: 0x171
// name: mcopy
// loadArgs: 3
- (void)op_mcopy:(TFArguments *)args
{
    if ([args argAtIndex:2] < [args argAtIndex:1])
    {
        for (uint32_t i = 0; i < [args argAtIndex:0]; i++)
            image.WriteByte([args argAtIndex:2] + i, image.ReadByte([args argAtIndex:1] + i));
    }
    else
    {
        for (uint32_t i = [args argAtIndex:0] - 1; i >= 0; i--)
            image.WriteByte([args argAtIndex:2] + i, image.ReadByte([args argAtIndex:1] + i));
    }
}

private bool HandleHeapMemoryRequest(uint32_t newEndMem)
{
    try
    {
        image.endMemory = newEndMem;
        return true;
    }
    catch
    {
        return false;
    }
}

// opcode: 0x178
// name: malloc
// loadArgs: 1
// storeArgs: 1
- (void)op_malloc:(TFArguments *)args
{
    uint32_t size = [args argAtIndex:0];
    if ((int)size <= 0)
    {
        [args setArg:0 atIndex:1];
        return;
    }

    if (heap == null)
    {
        uint32_t oldEndMem = image.endMemory;
        heap = new HeapAllocator(oldEndMem, HandleHeapMemoryRequest);
        heap.MaxSize = maxHeapSize;
        [args argAtIndex:1] = heap.Alloc(size);
        if ([args argAtIndex:1] == 0)
        {
            heap = null;
            image.endMemory = oldEndMem;
        }
    }
    else
    {
        [args argAtIndex:1] = heap.Alloc(size);
    }
}

// opcode: 0x179
// name: mfree
// loadArgs: 1
- (void)op_mfree:(TFArguments *)args
{
    if (heap != NULL)
    {
        heap.Free([args argAtIndex:0]];
        if (heap.BlockCount == 0)
        {
            image.endMemoryory = heap.Address;
            heap = NULL;
        }
    }
}

#pragma mark Searching

private bool KeyIsZero(uint32_t address, uint32_t size)
{
    for (uint32_t i = 0; i < size; i++)
        if (image.ReadByte(address + i) != 0)
            return false;

    return true;
}

// opcode: 0x150
// name: linearsearch
// loadArgs: 7
// storeArgs: 1
- (void)op_linearsearch:(TFArguments *)args
{
    uint32_t key = [args argAtIndex:0];
    uint32_t keySize = [args argAtIndex:1];
    uint32_t start = [args argAtIndex:2];
    uint32_t structSize = args[3];
    uint32_t numStructs = args[4];
    uint32_t keyOffset = args[5];
    SearchOptions options = (SearchOptions)args[6];

    if (keySize > 4 && (options & SearchOptions.KeyIndirect) == 0)
        throw new VMException("KeyIndirect option must be used when searching for a >4 byte key");

    uint32_t result = (options & SearchOptions.KeyIndirect) == 0 ? 0 : 0xFFFFFFFF;

    for (uint32_t index = 0; index < numStructs; index++)
    {
        if ((options & SearchOptions.ZeroKeyTerminates) != 0 &&
            KeyIsZero(start + index * structSize + keyOffset, keySize))
        {
            // stop searching, even if this key would match
            break;
        }

        int cmp = CompareKeys(key, start + index * structSize + keyOffset, keySize, options);
        if (cmp == 0)
        {
            // found it
            if ((options & SearchOptions.ReturnIndex) == 0)
                result = start + index * structSize;
            else
                result = index;
            break;
        }
    }

    args[7] = result;
}

// opcode: 0x151
// name: binarysearch
// loadArgs: 7
// storeArgs: 1
- (void)op_binarysearch:(TFArguments *)args
{
    uint32_t key = [args argAtIndex:0];
    uint32_t keySize = [args argAtIndex:1];
    uint32_t start = [args argAtIndex:2];
    uint32_t structSize = args[3];
    uint32_t numStructs = args[4];
    uint32_t keyOffset = args[5];
    SearchOptions options = (SearchOptions)args[6];

    args[7] = PerformBinarySearch(key, keySize, start, structSize, numStructs, keyOffset, options);
}

// opcode: 0x152
// name: linkedsearch
// loadArgs: 6
// storeArgs: 1
- (void)op_linkedsearch:(TFArguments *)args
{
    uint32_t key = [args argAtIndex:0];
    uint32_t keySize = [args argAtIndex:1];
    uint32_t start = [args argAtIndex:2];
    uint32_t keyOffset = args[3];
    uint32_t nextOffset = args[4];
    SearchOptions options = (SearchOptions)args[5];

    uint32_t result = 0;
    uint32_t node = start;

    while (node != 0)
    {
        if ((options & SearchOptions.ZeroKeyTerminates) != 0 &&
            KeyIsZero(node + keyOffset, keySize))
        {
            // stop searching, even if this key would match
            break;
        }

        int cmp = CompareKeys(key, node + keyOffset, keySize, options);
        if (cmp == 0)
        {
            // found it
            result = node;
            break;
        }

        // advance to next item
        node = image.ReadInt32(node + nextOffset);
    }

    args[6] = result;
}

#pragma mark Stack Manipulation

// opcode: 0x50
// name: stkcount
// loadArgs: 0
// storeArgs: 1
- (void)op_stkcount:(TFArguments *)args
{
    [args setArg:(sp - (fp + frameLen)) / 4 atIndex:0];
}

// opcode: 0x51
// name: stkpeek
// loadArgs: 1
// storeArgs: 1
- (void)op_stkpeek:(TFArguments *)args
{
    uint32_t position = sp - 4 * (1 + [args argAtIndex:0]];
    if (position < (fp + frameLen))
        throw new VMException("Stack underflow");

    [args setArg:ReadFromStack(position) atIndex:1];
}

// opcode: 0x52
// name: stkswap
// loadArgs: 0
- (void)op_stkswap:(TFArguments *)args
{
    if (sp - (fp + frameLen) < 8)
        throw new VMException("Stack underflow");

    uint32_t a = Pop();
    uint32_t b = Pop();
    Push(a);
    Push(b);
}

// opcode: 0x53
// name: stkroll
// loadArgs: 2
- (void)op_stkroll:(TFArguments *)args
{
    int items = (int)[args argAtIndex:0];
    int distance = (int)[args argAtIndex:1];

    if (items != 0)
    {
        distance %= items;

        if (distance != 0)
        {
            // rolling X items down Y slots == rolling X items up X-Y slots
            if (distance < 0)
                distance += items;

            if (sp - (fp + frameLen) < 4 * items)
                throw new VMException("Stack underflow");

            Stack<uint32_t> temp1 = new Stack<uint32_t>(distance);
            Stack<uint32_t> temp2 = new Stack<uint32_t>(items - distance);

            for (int i = 0; i < distance; i++)
                temp1.Push(Pop());
            for (int i = distance; i < items; i++)
                temp2.Push(Pop());
            while (temp1.Count > 0)
                Push(temp1.Pop());
            while (temp2.Count > 0)
                Push(temp2.Pop());
        }
    }
}

// opcode: 0x54
// name: stkcopy
// loadArgs: 1
- (void)op_stkcopy:(TFArguments *)args
{
    uint32_t bytes = [args argAtIndex:0] * 4;
    if (bytes > sp - (fp + frameLen))
        throw new VMException("Stack underflow");

    uint32_t start = sp - bytes;
    while (bytes-- > 0)
        stack[sp++] = stack[start++];
}

private enum Gestalt
{
    GlulxVersion = 0,
    TerpVersion = 1,
    ResizeMem = 2,
    Undo = 3,
    IOSystem = 4,
    Unicode = 5,
    MemCopy = 6,
    MAlloc = 7,
    MAllocHeap = 8,
}

// opcode: 0x100
// name: gestalt
// loadArgs: 2
// storeArgs: 1
- (void)op_gestalt:(TFArguments *)args
{
    Gestalt selector = (Gestalt)[args argAtIndex:0];
    switch (selector)
    {
        case Gestalt.GlulxVersion:
            [args setArg:0x00030100 atIndex:2];
            break;

        case Gestalt.TerpVersion:
            [args setArg:0x00000900 atIndex:2];
            break;

        case Gestalt.ResizeMem:
        case Gestalt.Undo:
        case Gestalt.Unicode:
        case Gestalt.MemCopy:
        case Gestalt.MAlloc:
            [args setArg:1 atIndex:2];
            break;

        case Gestalt.IOSystem:
            if ([args argAtIndex:1] == 0 || [args argAtIndex:1] == 1 || [args argAtIndex:1] == 20)
                [args setArg:1 atIndex:2];
            else
                [args setArg:0 atIndex:2];
            break;

        case Gestalt.MAllocHeap:
            if (heap == null)
                [args setArg:0 atIndex:2];
            else
                [args setArg:heap.Address atIndex:2];
            break;

        default:
            // unrecognized gestalt selector
            [args setArg:0 atIndex:2];
            break;
    }
}

// opcode: 0x101
// name: debugtrap
// loadArgs: 1
- (void)op_debugtrap:(TFArguments *)args
{
    uint32_t status = [args argAtIndex:0];
    System.Diagnostics.Debugger.Break();
}

#pragma mark Game State

// opcode: 0x120
// name: quit
// loadArgs: 0
- (void)op_quit:(TFArguments *)args
{
    // end execution
    running = false;
}

// opcode: 0x121
// name: verify
// loadArgs: 0
// storeArgs: 1
- (void)op_verify:(TFArguments *)args
{
    // we already verified the game when it was loaded
    [args setArg:0 atIndex:0];
}

// opcode: 0x122
// name: restart
// loadArgs: 0
- (void)op_restart:(TFArguments *)args
{
    Restart();
}

// opcode: 0x123
// name: save
// loadArgs: 1
// rule: DelayedStore
- (void)op_save:(TFArguments *)args
{
    if (nestingLevel == 0 && SaveRequested != null)
    {
        SaveRestoreEventArgs e = new SaveRestoreEventArgs();
        SaveRequested(this, e);
        if (e.Stream != null)
        {
            try
            {
                do
                {
                    try
                    {
                        SaveToStream(e.Stream, [args argAtIndex:1], [args argAtIndex:2]];
                    }
                    catch (Exception ex)
                    {
                        if (SaveRestoreError != null)
                        {
                            SaveRestoreErrorEventArgs ee = new SaveRestoreErrorEventArgs();
                            ee.WasSaving = true;
                            ee.Exception = ex;
                            ee.Stream = e.Stream;
                            ee.Retry = false;
                            SaveRestoreError(this, ee);

                            if (ee.Retry)
                            {
                                if (e.Stream != ee.Stream)
                                {
                                    e.Stream.Close();
                                    e.Stream = ee.Stream;
                                }
                                continue;
                            }
                        }

                        // unrecoverable
                        PerformDelayedStore([args argAtIndex:1], [args argAtIndex:2], 1);
                        return;
                    }
                } while (false);
            }
            finally
            {
                e.Stream.Close();
            }
            PerformDelayedStore([args argAtIndex:1], [args argAtIndex:2], 0);
            return;
        }
    }

    // failed
    PerformDelayedStore([args argAtIndex:1], [args argAtIndex:2], 1);
}

// opcode: 0x124
// name: restore
// loadArgs: 1
// rule: DelayedStore
- (void)op_restore:(TFArguments *)args
{
    if (LoadRequested != null)
    {
        SaveRestoreEventArgs e = new SaveRestoreEventArgs();
        LoadRequested(this, e);
        if (e.Stream != null)
        {
            try
            {
                do
                {
                    try
                    {
                        LoadFromStream(e.Stream);
                    }
                    catch (Exception ex)
                    {
                        if (SaveRestoreError != null)
                        {
                            SaveRestoreErrorEventArgs ee = new SaveRestoreErrorEventArgs();
                            ee.WasSaving = false;
                            ee.Exception = ex;
                            ee.Stream = e.Stream;
                            ee.Retry = false;
                            SaveRestoreError(this, ee);

                            if (ee.Retry)
                            {
                                if (e.Stream != ee.Stream)
                                {
                                    e.Stream.Close();
                                    e.Stream = ee.Stream;
                                }
                                continue;
                            }
                        }

                        // unrecoverable
                        PerformDelayedStore([args argAtIndex:1], [args argAtIndex:2], 1);
                        return;
                    }
                } while (false);
            }
            finally
            {
                e.Stream.Close();
            }
            return;
        }
    }

    // failed
    PerformDelayedStore([args argAtIndex:1], [args argAtIndex:2], 1);
}

// opcode: 0x125
// name: saveundo
// loadArgs: 0
// storeArgs: 0
// rule: DelayedStore
- (void)op_saveundo:(TFArguments *)args
{
    if (nestingLevel != 0)
    {
        // can't save if there's native code on the call stack
        PerformDelayedStore([args argAtIndex:0], [args argAtIndex:1], 1);
        return;
    }

    MemoryStream buffer = new MemoryStream();
    SaveToStream(buffer, [args argAtIndex:0], [args argAtIndex:1]];

    if (undoBuffers.Count >= MAX_UNDO_LEVEL)
        undoBuffers.RemoveAt(0);

    undoBuffers.Add(buffer);

    PerformDelayedStore([args argAtIndex:0], [args argAtIndex:1], 0);
}

// opcode: 0x126
// name: restoreundo
// loadArgs: 0
// storeArgs: 0
// rule: DelayedStore
- (void)op_restoreundo:(TFArguments *)args
{
    if (undoBuffers.Count == 0)
    {
        PerformDelayedStore([args argAtIndex:0], [args argAtIndex:1], 1);
    }
    else
    {
        MemoryStream buffer = undoBuffers[undoBuffers.Count - 1];
        undoBuffers.RemoveAt(undoBuffers.Count - 1);

        buffer.Seek(0, System.IO.SeekOrigin.Begin);
        LoadFromStream(buffer);
    }
}

// opcode: 0x127
// name: protect
// loadArgs: 2
- (void)op_protect:(TFArguments *)args
{
    if ([args argAtIndex:0] < image.endMemory)
    {
        protectionStart = [args argAtIndex:0];
        protectionLength = [args argAtIndex:1];

        if (protectionStart >= image.RamStart)
        {
            protectionStart -= image.RamStart;
        }
        else
        {
            protectionStart = 0;
            protectionLength -= image.RamStart - protectionStart;
        }

        if (protectionStart + protectionLength > image.endMemory)
            protectionLength = image.endMemory - protectionStart;
    }
}

#pragma mark Random Number Generator

// opcode: 0x110
// name: random
// loadArgs: 1
// storeArgs: 1
- (void)op_random:(TFArguments *)args
{
    if ([args argAtIndex:0] == 0)
    {
        // 32 random bits
        byte[] buffer = new byte[4];
        randomGenerator.NextBytes(buffer);
        [args argAtIndex:1] = (uint32_t)(buffer[0] << 24 + buffer[1] << 16 + buffer[2] << 8 + buffer[3]];
    }
    else if ((int)[args argAtIndex:0] > 0)
    {
        // range: 0 to [args argAtIndex:0] - 1
        [args argAtIndex:1] = (uint32_t)randomGenerator.Next((int)[args argAtIndex:0]];
    }
    else
    {
        // range: [args argAtIndex:0] + 1 to 0
        [args setArg:(uint32_t)(-randomGenerator.Next(-(int)[args argAtIndex:0])) atIndex:1];
    }
}

// opcode: 0x111
// name: setrandom
// loadArgs: 1
- (void)op_setrandom:(TFArguments *)args
{
    if ([args argAtIndex:0] == 0)
        randomGenerator = new Random();
    else
        randomGenerator = new Random((int)[args argAtIndex:0]];
}

#pragma mark FyreVM Specific

/// <summary>
/// Selects a function for the FyreVM system call opcode.
/// </summary>
private enum FyreCall
{
    /// <summary>
    /// Reads a line from the user: [args argAtIndex:1] = buffer, [args argAtIndex:2] = buffer size.
    /// </summary>
    ReadLine = 1,
    /// <summary>
    /// Selects a text style: [args argAtIndex:1] = an OutputStyle value (see OutputBuffer.cs).
    /// </summary>
    SetStyle = 2,
    /// <summary>
    /// Converts a character to lowercase: [args argAtIndex:1] = the character,
    /// result = the lowercased character.
    /// </summary>
    ToLower = 3,
    /// <summary>
    /// Converts a character to uppercase: [args argAtIndex:1] = the character,
    /// result = the uppercased character.
    /// </summary>
    ToUpper = 4,
    /// <summary>
    /// Selects an output channel: [args argAtIndex:1] = an OutputChannel value (see Output.cs).
    /// </summary>
    Channel = 5,
    /// <summary>
    /// Turns the main channel's output filtering on or off: [args argAtIndex:1] = nonzero to
    /// turn it on.
    /// </summary>
    EnableFilter = 6,
    /// <summary>
    /// Reads a character from the user: result = the 16-bit Unicode value.
    /// </summary>
    ReadKey = 7,
    /// <summary>
    /// Registers a veneer function address or constant value: [args argAtIndex:1] = a
    /// VeneerSlot value (see Veneer.cs), [args argAtIndex:2] = the function address or
    /// constant value, result = nonzero if the value was accepted.
    /// </summary>
    SetVeneer = 8,
}

// opcode: 0x1000
// name: fyrecall
// loadArgs: 3
// storeArgs: 1
- (void)op_fyrecall:(TFArguments *)args
{
    args[3] = 0;

    FyreCall call = (FyreCall)[args argAtIndex:0];
    switch (call)
    {
        case FyreCall.ReadLine:
            DeliverOutput();
            InputLine([args argAtIndex:1], [args argAtIndex:2]];
            break;

        case FyreCall.ReadKey:
            DeliverOutput();
            args[3] = (uint32_t)InputChar();
            break;

        case FyreCall.SetStyle:
            outputBuffer.SetStyle((OutputStyle)[args argAtIndex:1]];
            break;

        case FyreCall.ToLower:
        case FyreCall.ToUpper:
            byte[] bytes = new byte[] { (byte)[args argAtIndex:1] };
            char[] chars = System.Text.Encoding.GetEncoding(LATIN1_CODEPAGE).GetChars(bytes);
            if (call == FyreCall.ToLower)
                chars[0] = char.ToLower(chars[0]];
            else
                chars[0] = char.ToUpper(chars[0]];
            bytes = System.Text.Encoding.GetEncoding(LATIN1_CODEPAGE).GetBytes(chars);
            args[3] = bytes[0];
            break;

        case FyreCall.Channel:
            outputBuffer.Channel = (OutputChannel)[args argAtIndex:1];
            break;

        case FyreCall.EnableFilter:
            gameWantsFiltering = ([args argAtIndex:1] != 0);
            outputBuffer.FilterEnabled = allowFiltering & gameWantsFiltering;
            break;

        case FyreCall.SetVeneer:
            args[3] = (uint32_t)(veneer.SetSlot([args argAtIndex:1], [args argAtIndex:2]) ? 1 : 0);
            break;

        default:
            throw new VMException("Unrecognized FyreVM system call #" + [args argAtIndex:0].ToString());
    }
}
*/
@end