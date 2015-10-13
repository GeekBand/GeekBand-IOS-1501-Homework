//
//  AppDelegate.h
//  IOS Final Test1
//
//  Created by 雷源 on 15/10/2.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"
#import "HttpRequestDemoTableViewController.h"
#import "SendMessageToWeiboViewController.h"
#define KAppKey  @"3595518097"
#define KRedirectURL  @"https://api.weibo.com/oauth2/default.html"

@class SendMessageToWeiboViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate, WeiboSDKDelegate>
{
    NSString* wbtoken;
    NSString* wbCurrentUserID;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *loginNavigationVC;
@property (strong, nonatomic) SendMessageToWeiboViewController *viewController;
@property (strong, nonatomic) NSString *wbtoken;
@property (strong, nonatomic) NSString *wbRefreshToken;
@property (strong, nonatomic) NSString *wbCurrentUserID;

-(void)loadMainFrame;
-(void)loadLoginView;
@end




