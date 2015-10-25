//
//  GBMRegisterViewController.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/17/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBMRegisterViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeatPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

- (IBAction)registerButtonClicked:(id)sender;
- (IBAction)loginButtonClicked:(id)sender;
- (IBAction)touchDownAction:(id)sender;

@end
