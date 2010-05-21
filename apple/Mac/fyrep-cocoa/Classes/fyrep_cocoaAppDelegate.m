//
//  fyrep_cocoaAppDelegate.m
//  fyrep-cocoa
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "fyrep_cocoaAppDelegate.h"

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
