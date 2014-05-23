//
//  WCMAppDelegate.m
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import "WCMAppDelegate.h"
#import "WCMWorkoutDataDoc.h"
#import "WCMMasterViewController.h"

@implementation WCMAppDelegate

BOOL IS_TEST_MODE=YES;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    
    NSMutableArray *workouts = [self loadBootstrapWorkoutData];
    UINavigationController *navController = (UINavigationController *
                                             )  self.window.rootViewController;
    WCMMasterViewController *masterController  =  [navController.viewControllers objectAtIndex:0];
    masterController.workouts = workouts;
    
    return YES;
}



- (NSMutableArray *) loadBootstrapWorkoutData {
    
    NSMutableArray *workouts = [[NSMutableArray alloc] initWithCapacity: 10];
    
   // if (IS_TEST_MODE) {
    WCMWorkoutDataDoc *workout1 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Run" distance:17 time:7200000 workoutDate:0.0 thumbImage:[UIImage imageNamed:@"run.png"]];
    WCMWorkoutDataDoc *workout2 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Bike" distance:27.5 time:7400000 workoutDate:0.0 thumbImage:[UIImage imageNamed:@"bike.png"]];
        
    WCMWorkoutDataDoc *workout3 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Bike" distance:17.5 time:7000000  workoutDate:0.0 thumbImage:[UIImage imageNamed:@"bike.png"]];
    WCMWorkoutDataDoc *workout4 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Bike" distance:17.5 time:600000 workoutDate:0.0 thumbImage:[UIImage imageNamed:@"bike.png"]];
        workouts = [NSMutableArray arrayWithObjects:workout1, workout2, workout3, workout4, nil];
    //}
    
    return workouts;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
