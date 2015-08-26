//
//  AppDelegate.m
//  GKMoranHouse
//
//  Created by house on 15/8/18.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+Hex.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"ee7f41"];
//    [[UINavigationBar appearance] setTintColor:[UIColor yellowColor]];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithHexString:@"ee7f41"]];

//    [self.window.rootViewController.navigationController.navigationBar setBarTintColor:[UIColor yellowColor]];
//     UIViewController *vc =self.window.rootViewController;
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"publish"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"public_hover"] forState:UIControlStateSelected];
//    button.frame = CGRectMake(240, self.window.frame.size.height-70, 44, 44);
//    CGPoint p=button.center;
//    p.x=vc.view.center.x;
//    button.center = p;
//    [vc.view addSubview:button];
    

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
