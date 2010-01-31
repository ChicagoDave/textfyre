//
//  fyrep_cocoatouchAppDelegate.h
//  fyrep-cocoatouch
//
//  Copyright 2010 Textfyre, Inc. All rights reserved.
//  Please read the accompanying COPYRIGHT file for licensing restrictions.
//

#import <UIKit/UIKit.h>

@interface fyrep_cocoatouchAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

