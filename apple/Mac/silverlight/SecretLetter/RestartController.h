//
//  RestartController.h
//  SecretLetter
//
//  Created by Justin de Vesine on 6/26/09.
//  Copyright 2009 ZiZ Productions. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface RestartController : NSWindowController {
	IBOutlet NSButton *restartButton;
    IBOutlet NSProgressIndicator *progressIndicator;
    IBOutlet NSTextField *statusField;
	
	IBOutlet NSWindow *installwindow;
	
	
	NSTask *task;
	NSTask *task1;
	NSTask *task2;
	NSString *path;
	
}

+ (RestartController *) sharedRestartController;

-(void) startInstall:(NSString *)dmgPath;

- (void)mountAsync:(NSString *)dmgPath;
- (void)mountExited:(NSNotification *)note;
- (void)installAsync:(NSString *)dmgPath;
- (void)installExited:(NSNotification *)note;
- (void)unmountAsync:(NSString *)dmgPath;
- (void)unmountExited:(NSNotification *)note;
- (IBAction)fireRestart:(id)sender;

@end
