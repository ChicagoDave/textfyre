//
//  fyrep_cocoaAppDelegate.h
//  fyrep-cocoa
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <Cocoa/Cocoa.h>

@class TFInterpreter;

@interface fyrep_cocoaAppDelegate : NSObject {

@private
    NSWindow *window;
    
    TFInterpreter *interpreter;
}

@property (assign) IBOutlet NSWindow *window;

@end
