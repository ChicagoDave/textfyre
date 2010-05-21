//
//  fyrep_cocoatouchAppDelegate.m
//  fyrep-cocoatouch
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import "fyrep_cocoatouchAppDelegate.h"

@implementation fyrep_cocoatouchAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
