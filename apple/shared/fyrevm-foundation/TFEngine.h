//
//  TFEngine.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


@class TFUlxImage;
@class TFVeneer;

/*! Represents a Glulx call stub, which describes the VM's state at the time of a function call or string printing task. */
typedef struct _TFCallStub {
    /*! The type of storage location (for function calls) or the previous task (for string printing). */
    uint32_t destType;
    /*! The storage address (for function calls) or the digit being examined (for string printing). */
    uint32_t destAddr;
    /*! The address of the opcode or character at which to resume. */
    uint32_t pc;
    /*! The stack frame in which the function call or string printing was performed. */
    uint32_t framePtr;
} TFCallStub;

typedef enum _TFSearchOptions
{
    TFNoSearchOptions = 0,

    TFKeyIndirectSearchOption = 1,
    TFZeroKeyTerminatesSearchOption = 2,
    TFReturnIndexSearchOption = 4
} TFSearchOptions;

/*! The main FyreVM class, which implements a modified Glulx interpreter. */
@interface TFEngine : NSObject {

@private
    NSDictionary *opcodeDict;

    // persistent machine state (written to save file)

    TFUlxImage *image;

    NSMutableData *stack;
    uint32_t pc; // program counter
    uint32_t sp; // stack ptr
    uint32_t fp; // call-frame ptr

    // TODO HeapAllocator *heap

    // transient state
    
    // transient state
    uint32_t frameLen, localsPos; // updated along with FP
//    IOSystem outputSystem;
//    OutputBuffer outputBuffer = new OutputBuffer();
    uint32_t filterAddress;
    uint32_t decodingTable;
//    StrNode nativeDecodingTable;
//    ExecutionMode execMode;
    uint8_t printingDigit; // bit number for compressed strings, digit for numbers
//    Random randomGenerator = new Random();
//    List<MemoryStream> undoBuffers = new List<MemoryStream>();
    uint32_t protectionStart, protectionLength; // relative to start of RAM!
    BOOL running;
    uint32_t nestedResult;
    int nestingLevel;
    TFVeneer *veneer;
    uint32_t maxHeapSize;
//    BOOL allowFiltering = true, gameWantsFiltering = true;
}

@property (readonly) TFUlxImage *image;

#pragma mark APIs

/*! Attempts to load Glulx (.ulx) game image file into memory and decrypt it. 

    On success, TODO (presumably, be ready for rest of steps needed to start game, whatever those are).

    On failure, technical details will be printed to Console.

    \param path Full path to Glulx (.ulx) file.
 */
- (BOOL)loadGameImageFromPath:(NSString *)path;

// TODO: may eventually move these into TFEngine_Opcodes.m

- (void)push:(uint32_t)value;
- (void)setStackInteger:(uint32_t)value atOffset:(uint32_t)offset;
- (uint32_t)pop;
- (uint32_t)readFromStack:(uint32_t)position;
-(void)pushCallStub:(TFCallStub)stub;
- (TFCallStub)popCallStub;

- (uint32_t)nestedCallAtAddress:(uint32_t)address;
- (uint32_t)nestedCallAtAddress:(uint32_t)address arg:(uint32_t)arg1;
- (uint32_t)nestedCallAtAddress:(uint32_t)address arg:(uint32_t)arg1 arg:(uint32_t) arg2;
- (uint32_t)nestedCallAtAddress:(uint32_t)address arg:(uint32_t)arg1 arg:(uint32_t)arg2 arg:(uint32_t)arg3;
/*! Executes a Glulx function and returns its result.

    \param address The address of the function.
    \param args The list of arguments, or NULL if no arguments need to be passed in.

    \return The function's return value.
 */
- (uint32_t)nestedCallAtAddress:(uint32_t)address args:(uint32_t *)args;

- (void)performDelayedStoreOfType:(uint32_t)type address:(uint32_t)address value:(uint32_t)value;

#pragma mark -

- (void)leaveFunction:(uint32_t)result;

- (void)takeBranch:(uint32_t)target;

#pragma mark Search APIs

/*! I don't have any idea what this does, and there is no documentation in the Windows codebase on it. Looks complicated! But I've transcribe it accurately, I believe. TODO: figure it out.
 */
- (int)compareKeysWithQuery:(uint32_t)query candidate:(uint32_t)candidate keySize:(uint32_t)keySize options:(TFSearchOptions)options;

- (uint32_t)performBinarySearchWithKey:(uint32_t)key keySize:(uint32_t)keySize start:(uint32_t)start structSize:(uint32_t)structSize numStructs:(uint32_t)numStructs keyOffset:(uint32_t)keyOffset options:(TFSearchOptions)options;

#pragma mark Exposed for testing ONLY, DO NOT USE

/*! Attempts to fill in opcode dictionary.

    On failure, technical details will be printed to Console.
 */
- (BOOL)initOpcodeDictionary;

@end

/*! Initializes a new call stub.

    \param destType The stub type.
    \param destAddr The storage address or printing digit.
    \param pc The address of the opcode or character at which to resume.
    \param framePtr The stack frame pointer.
 */
static inline TFCallStub TFMakeCallStub(uint32_t destType, uint32_t destAddr, uint32_t pc, uint32_t framePtr) {
    TFCallStub s;

    s.destType = destType;
    s.destAddr = destAddr;
    s.pc = pc;
    s.framePtr = framePtr;
    
    return s;
}
