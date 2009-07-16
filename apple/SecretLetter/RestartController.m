//
//  RestartController.m
//  SecretLetter
//
//  Created by Justin de Vesine on 6/26/09.
//  Copyright 2009 ZiZ Productions. All rights reserved.
//

#import "RestartController.h"

static BOOL didStart;

@implementation RestartController
+ (RestartController *) sharedRestartController
{
    static RestartController *g_inspector;
	
    if (g_inspector == nil) {
        g_inspector = [[RestartController alloc]
					   initWithWindowNibName: @"Installer"];
		
        assert (g_inspector != nil); // or other error handling
		
        [g_inspector showWindow: self];
    }
	
    return (g_inspector);
	
} // sharedInspector

+(BOOL) getDidStart
{
	return didStart;
}

+(void) setDidStart:(BOOL) newDidStart
{
	didStart = newDidStart;
}

- (void) restartOurselves
{
	//$N = argv[N]
	NSString *killArg1AndOpenArg2Script = @"kill -9 $1 \n open \"$2\"";
	
	/*NSTask needs its arguments to be strings */
	
	NSString *ourPID = [NSString stringWithFormat:@"%d",
	
	[[NSProcessInfo processInfo] processIdentifier]];
	
	//this will be the path to the .app bundle,
	//not the executable inside it; exactly what `open` wants
	NSString * pathToUs = [[NSBundle mainBundle] bundlePath];
	
	NSArray *shArgs = [NSArray arrayWithObjects:@"-c", // -c tells sh to execute the next argument, passing it the remaining arguments.
		killArg1AndOpenArg2Script,
		@"", //$0 path to script (ignored)
		ourPID, //$1 in restartScript
		pathToUs, //$2 in the restartScript
		nil];
	NSLog(@"command: %@", shArgs);
	NSTask *restartTask = [NSTask launchedTaskWithLaunchPath:@"/bin/sh" arguments:shArgs];
	[restartTask waitUntilExit]; //wait for killArg1AndOpenArg2Script to finish
	NSLog(@"*** ERROR: %@ should have been terminated, but we are still running", pathToUs);
	assert(!"We should not be running!");
}

- (IBAction)fireRestart:(id)sender
{
	[statusField setStringValue:[NSString stringWithFormat:@"Restarting..."]];
	[self restartOurselves];
}

- (void) startInstall:(NSString *)dmgPath
{
	[[NSNotificationCenter defaultCenter]
	 postNotificationName:@"InstallerOpened" object:self];

	
	path = [dmgPath retain];
	
	[statusField setStringValue:[NSString stringWithFormat:@"Beginning Silverlight install..."]];
	[self mountAsync:path];
	
}

- (void)mountAsync:(NSString *)dmgPath
{


	if ([RestartController getDidStart] == YES) {
		return;
	}
	
	[RestartController setDidStart:YES];
    task = [[NSTask alloc] init]; 
    [task setLaunchPath:@"/usr/bin/hdiutil"];
    [task setArguments:[NSArray arrayWithObjects:@"attach", @"-plist", @"-noautoopen", @"-puppetstrings", dmgPath, nil]];

/*	NSString *instScript = @"kill -9 $1 \n open \"$2\"";

	NSArray *instArgs = [NSArray arrayWithObjects:@"-c", // -c tells sh to execute the next argument, passing it the remaining arguments.
					   instScript,
					   @"", //$0 path to script (ignored)
					   ourPID, //$1 in restartScript
					   pathToUs, //$2 in the restartScript
					   nil];
*/
    [[NSNotificationCenter defaultCenter] 
	 addObserver:self 
	 selector:@selector(mountExited:) 
	 name:NSTaskDidTerminateNotification 
	 object:task
	 ];
	
    [task launch];
	[statusField setStringValue:[NSString stringWithFormat:@"Mounting Silverlight image..."]];

    // Execution continues in -taskExited:, below.
}

- (void)mountExited:(NSNotification *)note
{
    // You've been notified!
	
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self 
	 name:NSTaskDidTerminateNotification 
	 object:task
	 ];
    [task release];
    task = nil;
	[self installAsync:path];
}

- (void)installAsync:(NSString *)dmgPath
{
	task1 = [[NSTask alloc] init]; 

	NSArray *fileparts = [[[path componentsSeparatedByString:@"/"] lastObject] componentsSeparatedByString:@"."];
	NSRange theRange;
	theRange.location = 0;
	theRange.length = [fileparts count] - 1;
	
	NSString *basename = [[fileparts subarrayWithRange:theRange] componentsJoinedByString:@"."];
	[basename autorelease];
	
	//NSString *foo = [NSString stringWithFormat:@"/Volumes/%@/%@.pkg", basename, basename];
	
    [task1 setLaunchPath:@"/usr/bin/open"];
    [task1 setArguments:[NSArray arrayWithObjects:@"-W", [NSString stringWithFormat:@"/Volumes/%@.3.0/%@.3.0.pkg", basename, basename], nil]];
	
    [[NSNotificationCenter defaultCenter] 
	 addObserver:self 
	 selector:@selector(installExited:) 
	 name:NSTaskDidTerminateNotification 
	 object:task
	 ];
    [task1 launch];
	[statusField setStringValue:[NSString stringWithFormat:@"Silverlight installer started, waiting for it to finish."]];

    // Execution continues in -taskExited:, below.
}

- (void)installExited:(NSNotification *)note
{
    // You've been notified!
	
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self 
	 name:NSTaskDidTerminateNotification 
	 object:task
	 ];
    [task1 release];
    task1 = nil;
	[self unmountAsync:path];
}

- (void)unmountAsync:(NSString *)dmgPath
{
	
	NSArray *fileparts = [[[path componentsSeparatedByString:@"/"] lastObject] componentsSeparatedByString:@"."];
	NSRange theRange;
	theRange.location = 0;
	theRange.length = [fileparts count] - 1;
	
	NSString *basename = [[fileparts subarrayWithRange:theRange] componentsJoinedByString:@"."];
	[basename autorelease];
	
	
    task = [[NSTask alloc] init]; 
    [task setLaunchPath:@"/usr/bin/hdiutil"];
    [task setArguments:[NSArray arrayWithObjects:@"detach", @"-force", [NSString stringWithFormat:@"/Volumes/%@.*", basename], nil]];
	
    [[NSNotificationCenter defaultCenter] 
	 addObserver:self 
	 selector:@selector(unmountExited:) 
	 name:NSTaskDidTerminateNotification 
	 object:task
	 ];
	
    [task launch];
	[statusField setStringValue:[NSString stringWithFormat:@"Unmounting Silverlight image..."]];

    // Execution continues in -taskExited:, below.
}

- (void)unmountExited:(NSNotification *)note
{
    // You've been notified!
	
    [[NSNotificationCenter defaultCenter] 
	 removeObserver:self 
	 name:NSTaskDidTerminateNotification 
	 object:task
	 ];
    [task release];
    task = nil;
	[statusField setStringValue:[NSString stringWithFormat:@"Press the button to restart the game."]];
	[restartButton setEnabled:YES];
}
@end
