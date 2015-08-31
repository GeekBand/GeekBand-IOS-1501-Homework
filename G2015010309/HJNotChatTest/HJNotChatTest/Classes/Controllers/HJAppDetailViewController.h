//
//  HJAppDetailViewController.h
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJAppInfo.h"

@interface HJAppDetailViewController : UIViewController<UITextViewDelegate>

@property (nonatomic, strong) HJAppInfo *appInfo;

@end
