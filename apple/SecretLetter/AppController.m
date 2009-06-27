#import "AppController.h"
#import "WebController.h"

@implementation AppController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Create a shared WebHistory object
    //WebHistory *myHistory = [[WebHistory alloc] init];
    //[WebHistory setOptionalSharedHistory:myHistory];

    // Observe WebHistory notifications
    //NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	[[NSApplication sharedApplication] setDelegate:self]; 
	[webController setAppController:self];
	[webController startWebView];
}

-(BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
    return YES;
}

- (void)closeWebView
{
	[webController close];
}
@end
