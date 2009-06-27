//
//  DownloadDelegate.h
//  BrowserDownloadDemo
//
//  Created by Robbie Duncan on 12/12/2006.
//  Copyright 2006 Robbie Duncan. You are granted rights to do anything you like with this file.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import <AppKit/AppKit.h>
#import "DownloadController.h"
#import "AppController.h"
#import "WebController.h"
#import "RestartController.h"

@interface DownloadDelegate : NSObject {
	NSString *suggestedFilename;
	NSString *filename;
	
	IBOutlet NSButton *downloadCancelButton;
    IBOutlet NSProgressIndicator *progressIndicator;
    IBOutlet NSTextField *statusField;
	
	IBOutlet NSWindow *downloadpanel;
	
	DownloadController *dc;
	WebController *wc;
	RestartController *restartController;
	
    BOOL isDownloading;
	
    NSURLDownload *download;
	
    int receivedContentLength;
    int expectedContentLength;
}
- (IBAction)fireCancel:(id)sender;

- (void)setWebController:(WebController *)webCont;
@end
