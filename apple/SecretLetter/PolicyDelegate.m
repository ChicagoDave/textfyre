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
	
	if ([host hasSuffix:@"microsoft.com"]) {
		[listener download];
	} else 
	{		
		if ([url scheme] == @"about" || [url isFileURL]) // Why sender class.  In case this is actually a WebView subclass that can show extra mime types
		{
			// This is a type of file that the webview says it can show.  Let it
			[listener use];
		}
		else
		{
			[[NSWorkspace sharedWorkspace] openURL:url];
			[listener ignore];
			// || [[sender class] canShowMIMEType:type]
			// Download that!
			//[listener download];
		}
	}
}

@end
