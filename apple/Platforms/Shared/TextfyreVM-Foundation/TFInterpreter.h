//
//  TFInterpreter.h
//  TextfyreVM-Foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Foundation/Foundation.h>

@class TFEngine;

/*! \brief Represents above-VM logic for running a TextFyre game.

    This is the first class in the TextfyreVM-Foundation codebase which isn't a direct port of a Windows FyreVM class. It's meant to wrap up the logic that is above the level of the virtual machine (TFEngine) but still shared between all the Apple platforms: Mac, iPhone, and iPad.
 */
@interface TFInterpreter : NSObject {
    NSDictionary *manifestDictionary;

    TFEngine *vm;
}

/*! Attempts to start game by loading Glulx (.ulx) game image file from bundle into memory and running it.

    On success, TODO. Returns on successful load and then needs further calls once events happen? Continues in background and must be synchronized with main thread?

    On failure, returns NO, at which point technical details will be printed to Console.
 */
- (BOOL)startGame;

#pragma mark Exposed for testing ONLY, DO NOT USE

/*! Attempts to start game by loading Glulx (.ulx) game image file from bundle into memory and running it.

    See startGame for more details.
    
    \param name Name of game file look for at top level of application (or test) bundle. If nil, uses first game found at top level of bundle (with names of files found sorted for testing reproducibility before first one is chosen).
 */
- (BOOL)startGameWithName:(NSString *)name;

@end
