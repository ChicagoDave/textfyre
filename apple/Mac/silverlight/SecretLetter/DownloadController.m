//
//  DownloadController.m
//  SecretLetter
//
//  Created by Justin de Vesine on 6/25/09.
//  Copyright 2009 ZiZ Productions. All rights reserved.
//

#import "DownloadController.h"


@implementation DownloadController

+ (DownloadController *) sharedDownloadController
{
    static DownloadController *g_inspector;
	
    if (g_inspector == nil) {
        g_inspector = [[DownloadController alloc]
					   initWithWindowNibName: @"Downloader"];
		
        assert (g_inspector != nil); // or other error handling
		
        [g_inspector showWindow: self];
    }
	
    return (g_inspector);
	
} // sharedInspector

- (NSButton *)getDownloadCancelButton {
	return downloadCancelButton;
}

- (NSProgressIndicator *)getProgressIndicator {
	return progressIndicator;
}

- (NSTextField *)getStatusField {
	return statusField;
}

- (NSWindow *)getDownloadPanel {
	return downloadpanel;
}

- (void)setParentThing:(id)sender {
	parentThing = sender;
}

- (IBAction)fireCancel:(id)sender
{
	if (parentThing != nil)
	{
		[parentThing fireCancel:sender];
	}
}
@end
