//
//  PolicyDelegate.m
//  BrowserDownloadDemo
//
//  Created by Robbie Duncan on 12/12/2006.
//  Copyright 2006 Robbie Duncan. You are granted rights to do anything you like with this file.
//

#import "PolicyDelegate.h"
#import <AppKit/AppKit.h>
#import <AppKit/NSWorkspace.h>

@implementation PolicyDelegate

- (void)webView:(WebView *)sender decidePolicyForMIMEType:(NSString *)type request:(NSURLRequest *)request frame:(WebFrame *)frame decisionListener:(id<WebPolicyDecisionListener>)listener
{
	NSString *host = [[request URL] host];
	
	NSURL *url = [request URL];
	
	NSLog(@"Considering %@", [url absoluteString]);
	
	if ([[url absoluteString] isEqualToString:@"http://www.microsoft.com/silverlight/get-started/install/default.aspx"]) // this is the "upgrade now" page
	{
		// http://www.microsoft.com/silverlight/handlers/getsilverlight.ashx
		// [[NSWorkspace sharedWorkspace] openURL:url];
		NSLog(@"Trying to open http://www.microsoft.com/silverlight/handlers/getsilverlight.ashx");
		[[NSNotificationCenter defaultCenter] postNotificationName:@"KickoffSilverlight" object:self];
		[listener ignore];
	}
	else if ([host hasSuffix:@"microsoft.com"] && [[url absoluteString] hasSuffix: @".dmg"]) 
	{
		NSLog(@"Trying to download %@", [url absoluteString]);
		[listener download];
	} 
	else 
	{		
		if ([[url scheme] isEqualToString:@"about"] || [url isFileURL]) // Why sender class.  In case this is actually a WebView subclass that can show extra mime types
		{
			// This is a type of file that the webview says it can show.  Let it
			NSLog(@"Trying to use %@", [url absoluteString]);
			[listener use];
		}
		else
		{
			NSLog(@"Trying to externally open %@", [url absoluteString]);

			[[NSWorkspace sharedWorkspace] openURL:url];
			[listener ignore];
			// || [[sender class] canShowMIMEType:type]
			// Download that!
			//[listener download];
		}
	}
}

@end
