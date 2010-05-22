//
//  TextfyreApp-MacAppDelegate.m
//  TextfyreApp-Mac
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "TextfyreApp-MacAppDelegate.h"

#import "TFInterpreter.h"

@implementation fyrep_cocoaAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	interpreter = [[TFInterpreter alloc] init];
    
    [interpreter startGame];
}

- (void)dealloc {
    [interpreter release], interpreter = nil;

    [super dealloc];
}

@end
