//
//  AppDelegate.m
//  Mo Ran
//
//  Created by Will Ge on 9/13/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "AppDelegate.h"

#import "GWLoginViewController.h"
#import "GWInitialViewController.h"
#import "GWUser.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];

  // 应用启动，判断是否需要登录
  if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"]) {
    [self loadMainView];
  } else {
    [self loadLoginView];
  }
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state.
  // This can occur for certain types of temporary interruptions (such as an
  // incoming phone call or SMS message) or when the user quits the application
  // and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down
  // OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate
  // timers, and store enough application state information to restore your
  // application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called
  // instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state;
  // here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the
  // application was inactive. If the application was previously in the
  // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if
  // appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Load Login view method

- (void)loadLoginView {
  UIStoryboard *loginStoryBoard =
      [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
  GWLoginViewController *loginViewController =
      (GWLoginViewController *)loginStoryBoard.instantiateInitialViewController;
  self.window.rootViewController = loginViewController;
}

#pragma mark - Load Main view method

- (void)loadMainView {
  UIStoryboard *mainStoryBoard =
      [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
  GWInitialViewController *mainInitialViewController =
      (GWInitialViewController *)
          mainStoryBoard.instantiateInitialViewController;
  self.window.rootViewController = mainInitialViewController;
}

@end
