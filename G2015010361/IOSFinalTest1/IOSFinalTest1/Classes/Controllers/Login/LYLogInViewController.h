//
//  LYLogInViewController.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYLogInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
- (IBAction)logInButtonClicked:(id)sender;

@end
