//
//  DownloadController.h
//  SecretLetter
//
//  Created by Justin de Vesine on 6/25/09.
//  Copyright 2009 ZiZ Productions. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DownloadController : NSWindowController {
	IBOutlet NSButton *downloadCancelButton;
    IBOutlet NSProgressIndicator *progressIndicator;
    IBOutlet NSTextField *statusField;
	
	IBOutlet NSWindow *downloadpanel;
	
	NSObject *parentThing;
	
}
- (NSButton *)getDownloadCancelButton;
- (NSProgressIndicator *)getProgressIndicator;
- (NSTextField *)getStatusField;
- (NSWindow *)getDownloadPanel;

- (void)setParentThing:(id)sender;
+ (DownloadController *) sharedDownloadController;

- (IBAction)fireCancel:(id)sender;


@end
