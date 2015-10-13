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
#import "SendMessageToWeiboViewController.h"
@interface AppDelegate ()

@end



@interface WBBaseRequest ()
- (void)debugPrint;
@end

@interface WBBaseResponse ()
- (void)debugPrint;
@end

@implementation AppDelegate

@synthesize wbtoken;
@synthesize wbCurrentUserID;
@synthesize wbRefreshToken;

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
    
    //LYFiveViewController *fiveViewController = [[LYFiveViewController alloc] init];
    SendMessageToWeiboViewController* fiveViewController = [[SendMessageToWeiboViewController alloc] init];

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
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp: KAppKey];
    
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


- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        NSString *title = NSLocalizedString(@"发送结果", nil);
        NSString *message = [NSString stringWithFormat:@"%@: %d\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode, NSLocalizedString(@"响应UserInfo数据", nil), response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil),response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        WBSendMessageToWeiboResponse* sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse*)response;
        NSString* accessToken = [sendMessageToWeiboResponse.authResponse accessToken];
        if (accessToken)
        {
            self.wbtoken = accessToken;
        }
        NSString* userID = [sendMessageToWeiboResponse.authResponse userID];
        if (userID) {
            self.wbCurrentUserID = userID;
        }
        [alert show];
    }
    else if ([response isKindOfClass:WBAuthorizeResponse.class])
    {
        NSString *title = NSLocalizedString(@"认证结果", nil);
        NSString *message = [NSString stringWithFormat:@"%@: %d\nresponse.userId: %@\nresponse.accessToken: %@\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode,[(WBAuthorizeResponse *)response userID], [(WBAuthorizeResponse *)response accessToken],  NSLocalizedString(@"响应UserInfo数据", nil), response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil), response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        
        self.wbtoken = [(WBAuthorizeResponse *)response accessToken];
        self.wbCurrentUserID = [(WBAuthorizeResponse *)response userID];
        self.wbRefreshToken = [(WBAuthorizeResponse *)response refreshToken];
        [alert show];
    }
    else if ([response isKindOfClass:WBPaymentResponse.class])
    {
        NSString *title = NSLocalizedString(@"支付结果", nil);
        NSString *message = [NSString stringWithFormat:@"%@: %d\nresponse.payStatusCode: %@\nresponse.payStatusMessage: %@\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode,[(WBPaymentResponse *)response payStatusCode], [(WBPaymentResponse *)response payStatusMessage], NSLocalizedString(@"响应UserInfo数据", nil),response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil), response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }
    else if([response isKindOfClass:WBSDKAppRecommendResponse.class])
    {
        NSString *title = NSLocalizedString(@"邀请结果", nil);
        NSString *message = [NSString stringWithFormat:@"accesstoken:\n%@\nresponse.StatusCode: %d\n响应UserInfo数据:%@\n原请求UserInfo数据:%@",[(WBSDKAppRecommendResponse *)response accessToken],(int)response.statusCode,response.userInfo,response.requestUserInfo];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate: self];
}
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [WeiboSDK handleOpenURL:url delegate: self];
}

@end
