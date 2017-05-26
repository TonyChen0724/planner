//
//  AppDelegate.m
//  TestPOSIX
//
//  Created by Xinru Chen on 5/21/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#import "AppDelegate.h"
#import "stdio.h"
#import "stdlib.h"
#import "sqlite_operations.hpp"
#import "string"

using namespace std;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *dbFilePathInDocDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"formalData.db"];
    NSLog(@"%@", dbFilePathInDocDir);
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbFilePathInDocDir]) {
        NSData *dbData = [[[NSDataAsset alloc] initWithName:@"formalData"] data];
        BOOL res = [dbData writeToFile:dbFilePathInDocDir atomically:YES];
        if (res) {
            NSLog(@"First time initiation. Database file extraction confirmed");
        } else {
            NSLog(@"First time initiation. Failure during database file extraction. Exiting.");
            exit(1);
        }
    }
     
    sqlite3_open([dbFilePathInDocDir cStringUsingEncoding:NSASCIIStringEncoding], &db);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
