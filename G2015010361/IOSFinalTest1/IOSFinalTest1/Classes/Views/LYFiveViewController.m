//
//  LYFiveViewController.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYFiveViewController.h"
#import "LYGetWBUserInfo.h"
@interface LYFiveViewController ()

@property(nonatomic, strong)LYGetWBUserInfo *getWBUserInfoRequest;

@end

@implementation LYFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _getWBUserInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    _getWBUserInfo.frame = CGRectMake(10, 160, self.view.bounds.size.width - 20, 44);
    [_getWBUserInfo setBackgroundColor:[UIColor purpleColor]];
    [_getWBUserInfo setTitle:@"确定" forState:UIControlStateNormal];
    [_getWBUserInfo setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
    [_getWBUserInfo addTarget:self
                   action:@selector(getWBUserInfoClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_getWBUserInfo];
    
    self.bgImageView.image = [UIImage imageNamed:@"bgFive"];
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 30)];
    _userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userNameTextField.placeholder = @"输入微博昵称";
    //    textField.secureTextEntry = YES;
    _userNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    textField.keyboardType = UIKeyboardTypeEmailAddress;
    _userNameTextField.returnKeyType = UIReturnKeyDone;
    _userNameTextField.font = [UIFont systemFontOfSize:14.0f];
    _userNameTextField.textColor = [UIColor orangeColor];
    _userNameTextField.delegate = self;
    _userNameTextField.contentVerticalAlignment = UIViewContentModeCenter;
    [self.view addSubview:_userNameTextField];

}


#pragma mark - UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
}


#pragma mark - Custom event methods

- (void)getWBUserInfoClicked:(id)sender
{
    _getWBUserInfo.backgroundColor = [UIColor whiteColor];
    self.getWBUserInfoRequest = [[LYGetWBUserInfo alloc] init];
    [self.getWBUserInfoRequest sendLoginRequestWithUserName: _userNameTextField.text
                                           delegate:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
