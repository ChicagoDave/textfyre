//
//  TFEngine.h
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>


@class TFUlxImage;

@interface TFEngine : NSObject {

@private
    TFUlxImage *image;

    NSMutableData *stack;
    uint32_t pc; // program counter
    uint32_t sp; // stack ptr
    uint32_t fp; // call-frame ptr
}

/*! Attempts to load Glulx (.ulx) game image file into memory and decrypt it. 

    On success, TODO (presumably, be ready for rest of steps needed to start game, whatever those are).

    On failure, technical details will be printed to Console.

    \param path Full path to Glulx (.ulx) file.
 */
- (BOOL)loadGameImageFromPath:(NSString *)path;

/*! Compares version numbers of image to what this game engine supports.

    On failure, technical details will be printed to Console.
 */
- (BOOL)isImageVersionCompatible:(TFUlxImage *)image;

/*! Method to call to dispose of resources. Is called by -dealloc, but also may be called early. Is also called by -loadFromPath: on failure.
 */
- (void)cleanup;

@end
