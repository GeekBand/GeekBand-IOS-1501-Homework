//
//  AppDelegate.h
//  Mo Ran
//
//  Created by Will Ge on 9/13/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


/**
 *  使用代码加载 Login.storyboard 的函数
 */
- (void)loadLoginView;

/**
 *  使用代码加载 Login.storyboard 的函数
 */
- (void)loadMainView;

@end

