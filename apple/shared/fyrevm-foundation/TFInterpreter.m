//
//  TFInterpreter.m
//  fyrevm-foundation
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TFInterpreter.h"

#import "TFEngine.h"


@implementation TFInterpreter

#pragma mark Private methods

/*! \brief Method to call to dispose of resources. Is called by -dealloc, but also may be called early internally on failure. Outside users of this class should not call this method, but should instead call -deallocate if they own an object of this type.
 */
- (void)cleanup {
    [manifestDictionary release], manifestDictionary = nil;
    
    [vm release], vm = nil;
}

#pragma mark APIs

- (BOOL)startGame {
    return [self startGameWithName:nil];
}


#pragma mark Exposed for testing ONLY, DO NOT USE

- (BOOL)startGameWithName:(NSString *)name {
    BOOL result = NO;

    // Get location of game from plist in bundle.
    
    // For actual games, mainBundle would be sufficient. However, for testing using otest, there is no main bundle, so we want the test bundle instead, hence the use of bundleForClass:.
    NSBundle *bundle = [NSBundle bundleForClass:[TFInterpreter class]];
    
    NSString *gamePath = nil;
    
    if (name == nil) {
        NSArray *paths = [bundle pathsForResourcesOfType:@"ulx" inDirectory:nil];
        if ([paths count] > 0) {
            paths = [paths sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
            gamePath = [paths objectAtIndex:0];
        }
    } else {
        gamePath = [bundle pathForResource:name ofType:@"ulx"];
    }

    if (gamePath == nil) {
        // TODO log
    } else {
        // Create virtual machine and have it load game.
        vm = [[TFEngine alloc] init];
        
        if ([vm loadGameImageFromPath:gamePath]) {
            result = [vm run];
        }
    }
    
    return result;
}

#pragma mark Standard methods

- (void)dealloc {
    [self cleanup];

    [super dealloc];
}

@end
