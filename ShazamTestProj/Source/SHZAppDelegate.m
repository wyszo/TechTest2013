//
//  SHZAppDelegate.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZAppDelegate.h"

@implementation SHZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /**
    * We should store fetched RSS data on a device here
    */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /**
     * Perhaps if a tag list has not been fetched correctly last time, we should try to fetch it at least in here
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
