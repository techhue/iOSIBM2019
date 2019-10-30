//
//  ALCAppDelegate.m
//  ApplicationLifeCycle3
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "ALCAppDelegate.h"
#import "ALCViewController.h"

@interface ALCAppDelegate()

- (NSString*)saveFilePath;

@end

@implementation ALCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"#######################\nApplication Did Finish Launching\n#####################");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    ALCViewController *controller = [[ALCViewController alloc] init];
    self.window.rootViewController = controller;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"\n#####################Application Will Resign Active\n#####################");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"\n#####################Applicaiton Did Enter Background\n#####################");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    ALCViewController *controller = (ALCViewController*) self.window.rootViewController;
    NSArray *values = [[NSArray alloc] initWithObjects:controller.question.text,
                       controller.answer.text,nil];
    [values writeToFile:[self saveFilePath] atomically:YES];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"\n#####################Application Will Enter Foreground\n#####################");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    NSString *myPath = [self saveFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    if(fileExists)
    {
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        if([values count] > 0)
        {
            ALCViewController *controller = (ALCViewController*) self.window.rootViewController;
            controller.question.text = [values objectAtIndex:0];
            controller.answer.text = [values objectAtIndex:1];
        }
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"\n#####################Application Did Become Active\n#####################");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSString *myPath = [self saveFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:myPath];
    
    if(fileExists)
    {
        NSArray *values = [[NSArray alloc] initWithContentsOfFile:myPath];
        if([values count] > 0)
        {
            ALCViewController *controller = (ALCViewController*) self.window.rootViewController;
            controller.question.text = [values objectAtIndex:0];
            controller.answer.text = [values objectAtIndex:1];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"\n#####################Application Will Terminate\n#####################");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    /*
     For applications that support background execution, this method is generally not called when the
     user quits the application because the application simply moves to the background in that case.
     However, this method may be called in situations where the application is running in the background
     (not suspended) and the system needs to terminate it for some reason.
     */
    
}

- (NSString*)saveFilePath
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[path objectAtIndex:0] stringByAppendingPathComponent:@"savefile.plist"];
}


@end
