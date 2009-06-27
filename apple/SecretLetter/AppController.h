#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "WebController.h"

@interface AppController : NSObject 
{
	IBOutlet WebController *webController;
}
- (void)dealloc;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication;
- (void)closeWebView;
@end
