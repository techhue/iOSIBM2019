//
//  ALCAppDelegate.m
//  ApplicationLifeCycle1
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "ALCAppDelegate.h"

@implementation ALCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"Application Did Finish Launching");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = Nil;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"Application Will Resign Active");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Applicaiton Did Enter Background");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"Application Will Enter Foreground");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"Application Did Become Active");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"Application Will Terminate");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    /*
     For applications that support background execution, this method is generally not called when the
     user quits the application because the application simply moves to the background in that case.
     However, this method may be called in situations where the application is running in the background
     (not suspended) and the system needs to terminate it for some reason.
    */ 

}

@end
