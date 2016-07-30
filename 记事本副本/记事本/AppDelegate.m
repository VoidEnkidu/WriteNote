//
//  AppDelegate.m
//  记事本
//
//  Created by 刘超然 on 16/7/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "writeTabBarController.h"
#import "writeSlideViewController.h"
#import "LeftViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc]init];
    //获取tabbar的控制器
    writeTabBarController * vc =[[writeTabBarController alloc]init];
    //获取left控制器
    LeftViewController * vc1 =[[LeftViewController alloc]init];
    //获取父控制器的同时,将上边两个控制器对象赋值进去
    writeSlideViewController *slideView =[[writeSlideViewController alloc] initWithTabBarView:vc andLeftController: vc1];
    self.window.rootViewController = slideView;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
