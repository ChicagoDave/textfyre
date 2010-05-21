//
//  DownloadDelegate.m
//  BrowserDownloadDemo
//
//  Created by Robbie Duncan on 12/12/2006.
//  Copyright 2006 Robbie Duncan. You are granted rights to do anything you like with this file.
//

#import "DownloadDelegate.h"
#import "DownloadController.h"
#import "AppController.h"
#import "WebController.h"
#import <WebKit/WebKit.h>
#import <AppKit/AppKit.h>
@implementation DownloadDelegate

static BOOL didStart;


+(BOOL) getDidStart
{
	return didStart;
}

+(void) setDidStart:(BOOL) newDidStart
{
	didStart = newDidStart;
}

- (void)setWebController:(WebController *)webCont 
{
	wc = webCont;
}

- (void)setDownloading:(BOOL)downloading
{
	//NSRect windowRect = NSMakeRect(10.0f, 10.0f, 800.0f, 600.0f);
	
	//NSWindow *newwindow = [[NSWindow alloc] initWithContentRect:windowRect styleMask:( NSResizableWindowMask || NSClosableWindowMask || NSTitledWindowMask) backing:NSBackingStoreBuffered defer:NO];
	
	//[newwindow makeKeyAndOrderFront:nil];
	
	
    if (downloading) {
			dc = [DownloadController sharedDownloadController];	
			[dc setParentThing:self];
			progressIndicator = [dc getProgressIndicator];
			statusField = [dc getStatusField];
			downloadCancelButton = [dc getDownloadCancelButton];
			
			[progressIndicator setMinValue:0];
			[progressIndicator setMaxValue:1.0];
            [progressIndicator setIndeterminate:YES];
            [progressIndicator startAnimation:self];
            [downloadCancelButton setKeyEquivalent:@"."];
            [downloadCancelButton setKeyEquivalentModifierMask:NSCommandKeyMask];
            [downloadCancelButton setTitle:@"Cancel"];

        } else {

            receivedContentLength = 0;
			[dc close];

			
        }
}

- (void)cancel
{
    [download cancel];
    [self setDownloading:NO];
	NSString *successMessage = [NSString stringWithFormat:@"The download was canceled.  Please restart the game or install Silverlight manually.  The game will now exit."];
    NSBeginAlertSheet(@"Download Canceled ", nil, nil, nil, [dc window], self, @selector(callbackQuit:returnCode:contextInfo:), @selector(callbackQuit:returnCode:contextInfo:), nil, successMessage);

}

- (void)open
{    
	[[NSWorkspace sharedWorkspace] openFile:filename];
}

- (IBAction)fireCancel:(id)sender
{
        [self cancel];
}

- (void)callbackQuit:(NSAlert *)alert returnCode:(int)returnCode contextInfo:(void *)contextInfo
{
	[NSApp stop:self];
}

- (void)callbackStartInstall:(NSAlert *)alert returnCode:(int)returnCode contextInfo:(void *)contextInfo
{
	restartController = [RestartController sharedRestartController];
	
	if ([DownloadDelegate getDidStart] == NO)
		[restartController startInstall:filename];

	[DownloadDelegate setDidStart:YES];
}

- (void)installerWindowWasOpened:(NSNotification *)notification
{
    //Converter *addedConverter = [notification object];
	[[dc getDownloadPanel] orderOut:[notification object]];
}

#pragma mark NSURLDownloadDelegate methods

- (void)downloadDidBegin:(NSURLDownload *)theDownload
{
	download = theDownload;
	[self setDownloading:YES];
	
	// This is where you would do something nice in terms of UI.
	NSLog(@"Download started.");
	[statusField setStringValue:@"Download started."];
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:@"DownloaderOpened" object:self];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(installerWindowWasOpened:)
												 name:@"InstallerOpened" object:nil];
	

}


- (NSWindow *)downloadWindowForAuthenticationSheet:(WebDownload *)download
{
    return downloadpanel;
}

- (void)download:(NSURLDownload *)theDownload didReceiveDataOfLength:(unsigned)length
{
    if (expectedContentLength > 0) {

        receivedContentLength += length;
        [progressIndicator setDoubleValue:(double)receivedContentLength / (double)expectedContentLength];
		[statusField setStringValue:[NSString stringWithFormat:@"Downloading %d of %dkb", receivedContentLength/1024, expectedContentLength/1024]];
    }
}

- (void)download:(NSURLDownload *)theDownload didReceiveResponse:(NSURLResponse *)response
{
	// A response was received.  We can use the response to get some interesting stuff like the expected content length
	// for use in progress indicators and a suggested filename that I'll be using here..
	suggestedFilename = [[response suggestedFilename] retain];
	
	expectedContentLength = [response expectedContentLength];
	
    if (expectedContentLength > 0) {
		NSLog(@"Got the expected content length");
        [progressIndicator setIndeterminate:NO];
        [progressIndicator setDoubleValue:0];
		[statusField setStringValue:[NSString stringWithFormat:@"Downloading 0 of %dkb", expectedContentLength/1024]];

    }
}

- (void)download:(NSURLDownload *)theDownload decideDestinationWithSuggestedFilename:(NSString *)theFilename
{
	NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:theFilename];
	filename = [path retain];
	NSLog(path);
	[download setDestination:path allowOverwrite:YES];

}

- (void)download:(NSURLDownload *)theDownload didFailWithError:(NSError *)error
{
    [self setDownloading:NO];
	
    NSString *errorDescription = [error localizedDescription];
    if (!errorDescription) {
        errorDescription = @"An error occured during download.";
    }
    NSString *errorMessage = [NSString stringWithFormat:@"%@  Please restart Secret Letter, or install Silverlight manually.", errorDescription];
    NSBeginAlertSheet(@"Download Failed ", nil, nil, nil, [dc window], dc, @selector(callbackQuit:returnCode:contextInfo:), @selector(callbackQuit:returnCode:contextInfo:), nil, errorMessage);
}

- (void)downloadDidFinish:(NSURLDownload *)theDownload
{
    [self setDownloading:NO];
	NSLog([NSString stringWithFormat:@"downloaded silverlight install to: %@", filename]);
	NSString *successMessage = [NSString stringWithFormat:@"The download finished.  Press OK to begin installing Silverlight."];
    NSBeginAlertSheet(@"Download Succeeded ", nil, nil, nil, [dc window], self, @selector(callbackStartInstall:returnCode:contextInfo:), @selector(callbackStartInstall:returnCode:contextInfo:), nil, successMessage);

//    [self open];
}

@end
