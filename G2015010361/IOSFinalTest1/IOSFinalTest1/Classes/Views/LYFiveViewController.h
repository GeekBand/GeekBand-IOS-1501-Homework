//
//  LYFiveViewController.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYBaseViewController.h"
#import "LYGetWBUserInfo.h"
@interface LYFiveViewController : LYBaseViewController<UITextFieldDelegate, UITextViewDelegate, LYGetWBUserInfoDelegate>

@property(nonatomic, strong)UITextField *userNameTextField;
@property(nonatomic, strong)UIButton *getWBUserInfo;


@end
