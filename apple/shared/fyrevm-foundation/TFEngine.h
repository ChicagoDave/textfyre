//
//  TFEngine.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


@class TFUlxImage;

/*! The main FyreVM class, which implements a modified Glulx interpreter. */
@interface TFEngine : NSObject {

@private
    NSDictionary *opcodeDict;

    TFUlxImage *image;

    NSMutableData *stack;
    uint32_t pc; // program counter
    uint32_t sp; // stack ptr
    uint32_t fp; // call-frame ptr
}

#pragma mark APIs

/*! Attempts to load Glulx (.ulx) game image file into memory and decrypt it. 

    On success, TODO (presumably, be ready for rest of steps needed to start game, whatever those are).

    On failure, technical details will be printed to Console.

    \param path Full path to Glulx (.ulx) file.
 */
- (BOOL)loadGameImageFromPath:(NSString *)path;

#pragma mark APIs for Opcodes

// TODO: may eventually move these into TFEngine_Opcodes.m

- (void)leaveFunction:(uint32_t)result;

- (void)takeBranch:(uint32_t)target;

#pragma mark Exposed for testing ONLY, DO NOT USE

/*! Attempts to fill in opcode dictionary.

    On failure, technical details will be printed to Console.
 */
- (BOOL)initOpcodeDictionary;

@end
