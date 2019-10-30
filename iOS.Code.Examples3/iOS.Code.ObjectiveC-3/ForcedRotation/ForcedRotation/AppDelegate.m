//
//  AppDelegate.m
//  ForcedRotation
//
//  Created by Tom Parry on 15/11/12.
//  Copyright (c) 2012 b2cloud. All rights reserved.
//

#import "AppDelegate.h"

#import "BaseViewController.h"
#import "BaseViewController.h"
#import "ForcedViewController.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setBackgroundColor:[UIColor clearColor]];
	
	BaseViewController* base = [[BaseViewController alloc] init];
	[base.view setBackgroundColor:[UIColor redColor]];
	[window setRootViewController:base];
	[base release];
	base = nil;
	
	[window makeKeyAndVisible];
	
	[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(presentController) userInfo:nil repeats:NO];
	
	return YES;
}

- (void) presentController
{
	ForcedViewController* forced = [[ForcedViewController alloc] init];
	[forced.view setBackgroundColor:[UIColor greenColor]];
	[window.rootViewController presentViewController:forced animated:YES completion:nil];
	[forced release];
	forced = nil;
}

- (void)dealloc
{
	[window release];
	window = nil;
	
	[super dealloc];
}

@end
