//
//  AppDelegate.h
//  IOS Final Test1
//
//  Created by 雷源 on 15/10/2.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *loginNavigationVC;

-(void)loadMainFrame;
-(void)loadLoginView;
@end

