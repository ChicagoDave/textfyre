#import <Cocoa/Cocoa.h>

@class WebView;

@interface WebController : NSObject
{
    IBOutlet WebView *webView;
    IBOutlet NSWindow *window;

	
    NSString *docTitle;
    NSString *frameStatus;
    NSString *resourceStatus;
    NSString *url;

    NSURL *URLToLoad;
    
	NSObject *appController;
	
    int resourceCount;
    int resourceFailedCount;
    int resourceCompletedCount;
}
- (void)setFrameStatus: (NSString *)s;
- (void)setResourceStatus: (NSString *)s;
- (void)startWebView;
- (void)close;
- (void)setAppController: (NSObject *)appCont;

@end
