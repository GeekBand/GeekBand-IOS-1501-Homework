//
//  AppDelegate.m
//  IOS Final Test1
//
//  Created by 雷源 on 15/10/2.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "AppDelegate.h"
#import "LYBaseViewController.h"
#import "LYOneViewController.h"
#import "LYTwoViewController.h"
#import "LYThreeViewController.h"
#import "LYFourViewController.h"
#import "LYFiveViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)loadLoginView
{
    UIStoryboard *storyboard
    = [UIStoryboard storyboardWithName:@"LYLogIn"
                                bundle:[NSBundle mainBundle]];//bundle 主目录
    self.loginNavigationVC = storyboard.instantiateInitialViewController;
    self.window.rootViewController = _loginNavigationVC;
    }
- (void)loadMainFrame
{
    LYOneViewController *oneViewController = [[LYOneViewController alloc] init];
    UINavigationController *oneNavigationController
    = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    oneNavigationController.tabBarItem.title = @"One";
    oneNavigationController.tabBarItem.image = [UIImage imageNamed:@"one.png"];
    //    oneNavigationController.navigationBar.translucent = NO;
    
    LYTwoViewController *twoViewController = [[LYTwoViewController alloc] init];
    UINavigationController *twoNavigationController
    = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    twoNavigationController.tabBarItem.title = @"Two";
    twoNavigationController.tabBarItem.image = [UIImage imageNamed:@"two.png"];
    
    LYThreeViewController *threeViewController = [[LYThreeViewController alloc] init];
    UINavigationController *threeNavigationController
    = [[UINavigationController alloc] initWithRootViewController:threeViewController];
    threeNavigationController.tabBarItem.title = @"Three";
    threeNavigationController.tabBarItem.image = [UIImage imageNamed:@"three.png"];
    
    LYFourViewController *fourViewController = [[LYFourViewController alloc] init];
    UINavigationController *fourNavigationController
    = [[UINavigationController alloc] initWithRootViewController:fourViewController];
    fourNavigationController.tabBarItem.title = @"Four";
    fourNavigationController.tabBarItem.image = [UIImage imageNamed:@"four.png"];
    
    LYFiveViewController *fiveViewController = [[LYFiveViewController alloc] init];
    UINavigationController *fiveNavigationController
    = [[UINavigationController alloc] initWithRootViewController:fiveViewController];
    fiveNavigationController.tabBarItem.title = @"Five";
    fiveNavigationController.tabBarItem.image = [UIImage imageNamed:@"five.png"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //    NSArray *viewControllers = [NSArray arrayWithObjects:oneNavigationController, nil];
    //    NSDictionary *dic = @{@"name":@"zhangsan", @"age":@30};
    [tabBarController setViewControllers:@[oneNavigationController,
                                           twoNavigationController,
                                           threeNavigationController,
                                           fourNavigationController,
                                           fiveNavigationController]];
    
    self.window.rootViewController = tabBarController;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];//need set launch image or
                                                                                //the bounds are not right
    self.window.backgroundColor = [UIColor purpleColor];
    [self.window makeKeyAndVisible];
    [self loadLoginView];
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
