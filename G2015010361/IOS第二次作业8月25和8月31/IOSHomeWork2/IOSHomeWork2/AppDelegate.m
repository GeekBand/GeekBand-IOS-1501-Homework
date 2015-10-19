//
//  AppDelegate.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "AppDelegate.h"
#import "mainFrame.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)loadMainFrame
{
    mainFrame *mainFrameController = [[mainFrame alloc] init];
    UINavigationController *mainNavc = [[UINavigationController alloc] initWithRootViewController:mainFrameController];
    mainNavc.tabBarItem.title = @"two";
    mainNavc.tabBarItem.title = @"One";
    mainNavc.tabBarItem.image = [UIImage imageNamed:@"icon1.png"];
    //UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //[tabBarController setViewControllers:@[mainFrameController]];
    
    
    
    self.window.rootViewController = mainNavc;
}






- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor lightTextColor];
    
    [self loadMainFrame];
    
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
