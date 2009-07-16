#import "WebController.h"
#import <WebKit/WebKit.h>

#import "PolicyDelegate.h"
#import "DownloadDelegate.h"

@implementation WebController

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
    [webView close];
    [docTitle release];
    [frameStatus release];
    [resourceStatus release];
    [URLToLoad release];
    [url release];
    [window release];
    [super dealloc];
}

- (id)webView
{
    return webView;
}

- (void)loadURL:(NSURL *)URL
{
    [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:URL]];
}

- (void)setURLToLoad:(NSURL *)URL
{
    [URL retain];
    [URLToLoad release];
    URLToLoad = URL;
}

- (void)startWebView
{
    // Add any code here that need to be executed once the windowController has loaded the document's window.

	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(downloaderWindowWasOpened:)
												 name:@"DownloaderOpened" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(silverlightWantsToDownload:)
												 name:@"KickoffSilverlight" object:nil];
	
    // Set the WebView delegates
    [webView setFrameLoadDelegate:self];
    [webView setUIDelegate:self];
    [webView setResourceLoadDelegate:self];
    DownloadDelegate *dd = [DownloadDelegate alloc];
	[webView setPolicyDelegate:[[PolicyDelegate alloc] init]];
	[webView setDownloadDelegate:[dd init]];
	
	[dd setWebController:self];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"SecretLetter" ofType:@"htm"];
	
    // Load a default URL
    NSURL *URL = [NSURL fileURLWithPath: path];
    [self loadURL:URL];
    [self setURLToLoad:nil];
}

- (void)setAppController:(NSObject *)appCont 
{
	appController = appCont;
}

- (void)close
{
    [webView close];
    //[super close];
}

- (void)downloaderWindowWasOpened:(NSNotification *)notification
{
    //Converter *addedConverter = [notification object];

	[window orderOut:self];
}

- (void)silverlightWantsToDownload:(NSNotification *)notification
{
	[self loadURL:[NSURL URLWithString:@"http://www.microsoft.com/silverlight/handlers/getsilverlight.ashx"]];
}

- (NSData *)dataRepresentationOfType:(NSString *)aType
{
    return [[[webView mainFrame] dataSource] data];
}

- (BOOL)readFromURL:(NSURL *)URL ofType:(NSString *)type error:(NSError **)error
{
    // If the WebView hasn't been created, load the URL in windowControllerDidLoadNib:.
    if (webView != nil)
        [self loadURL:URL];
    else
        [self setURLToLoad:URL];
    *error = nil;
    return YES;
}

- (BOOL)readFromFile:(NSString *)path ofType:(NSString *)type
{
    // This method is called on Panther and is deprecated on Tiger. 
    // On Tiger, readFromURL:ofType:error is called instead.
    NSError *error;
    return [self readFromURL:[NSURL fileURLWithPath:path] ofType:type error:&error];
}


// Methods used to update the load status

// Updates the status and error messages
- (void)updateWindow
{
	NSString *foo;
	if (docTitle == nil) 
	{
		foo = @"Secret Letter";
	} else {
		foo = docTitle;
	}
    if (resourceStatus != nil)
        [[webView window] setTitle:[NSString stringWithFormat:@"%@:  %@", foo, resourceStatus]];
    else if (frameStatus != nil)
        [[webView window] setTitle:[NSString stringWithFormat:@"%@:  %@", foo, frameStatus]];
    else if (docTitle != nil)
        [[webView window] setTitle:docTitle];
    else
        [[webView window] setTitle:@""];
}

// Updates the resource status and error messages
- (void)updateResourceStatus
{
    if (resourceFailedCount)
        [self setResourceStatus:[NSString stringWithFormat:@"Loaded %d of %d, %d resource errors", resourceCompletedCount, resourceCount - resourceFailedCount, resourceFailedCount]];
    else
        [self setResourceStatus:[NSString stringWithFormat:@"Loaded %d of %d", resourceCompletedCount, resourceCount]];
    [[webView window] setTitle:[NSString stringWithFormat:@"%@", docTitle]];
}


// Accessor methods for instance variables

- (NSString *)docTitle
{
    return docTitle;
}

- (void)setDocTitle:(NSString *)t
{
	if (docTitle == nil)
	{
		[docTitle release];
		docTitle = [t retain];
	}
}

- (NSString *)frameStatus
{
    return frameStatus;
}

- (void)setFrameStatus:(NSString *)s
{
    [frameStatus release];
    frameStatus = [s retain];
}

- (NSString *)resourceStatus
{
    return resourceStatus;
}

- (void)setResourceStatus:(NSString *)s
{
    [resourceStatus release];
    resourceStatus = [s retain];
}

- (NSString *)url
{
    return url;
}

- (void)setURL:(NSString *)u
{
    [url release];
    url = [u retain];
}


// WebFrameLoadDelegate Methods

- (void)webView:(WebView *)sender didStartProvisionalLoadForFrame:(WebFrame *)frame
{
    // Only report feedback for the main frame.
    if (frame == [sender mainFrame]) {
        // Reset resource status variables
        resourceCount = 0;    
        resourceCompletedCount = 0;
        resourceFailedCount = 0;
    

        [self setFrameStatus:@"Loading..."];
        [self setURL:[[[[frame provisionalDataSource] request] URL] absoluteString]];
        [self updateWindow];
    }
}

- (void)webView:(WebView *)sender didReceiveTitle:(NSString *)title forFrame:(WebFrame *)frame
{
    // Only report feedback for the main frame.
    if (frame == [sender mainFrame]) {
        [self setDocTitle:title];
        [self updateWindow];
    }
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    // Only report feedback for the main frame.
    if (frame == [sender mainFrame]) {
        [self setFrameStatus:@""];
        [self updateWindow];
    }
}

- (void)webView:(WebView *)sender didFailProvisionalLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{
    // Only report feedback for the main frame.
    if (frame == [sender mainFrame]) {
        [self setDocTitle:@""];
        [self setFrameStatus:[error description]];
        [self updateWindow];
    }
}


// WebResourceLoadDelegate Methods

- (id)webView:(WebView *)sender identifierForInitialRequest:(NSURLRequest *)request fromDataSource:(WebDataSource *)dataSource
{
    // Return some object that can be used to identify this resource
    return [NSNumber numberWithInt:resourceCount++];    
}

-(NSURLRequest *)webView:(WebView *)sender resource:(id)identifier willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponsefromDataSource:(WebDataSource *)dataSource
{
    // Update the status message
    [self updateResourceStatus];
    return request;
}

-(void)webView:(WebView *)sender resource:(id)identifier didFailLoadingWithError:(NSError *)error fromDataSource:(WebDataSource *)dataSource
{
    // Increment the failed count and update the status message
    resourceFailedCount++;
    [self updateResourceStatus];
}

-(void)webView:(WebView *)sender resource:(id)identifier didFinishLoadingFromDataSource:(WebDataSource *)dataSource
{
    // Increment the success count and pdate the status message
    resourceCompletedCount++;
    [self updateResourceStatus];    
}


@end
