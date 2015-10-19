//
//  LoginViewController.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "GBMUserModel.h"
#import "GBMLoginRequest.h"
#import "GBMGlobal.h"
#import "GBMGetImage.h"

@interface LoginViewController () <GBMLoginRequestDelegate>

@property (nonatomic, strong) GBMLoginRequest *loginRequest;
@property (nonatomic, strong) UITextField *textView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置输入框的代理
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    // 设置登录按钮为圆角矩形
    self.loginButton.layer.cornerRadius = 5.0;
    self.loginButton.clipsToBounds = YES;
}

//通过代理来让键盘上的return键实现关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)touchDownAction:(id)sender
{
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 登录按钮点击后的方法
- (IBAction)loginButtonClicked:(id)sender
{
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    
    // 验证邮箱和密码是否都有输入内容，且检查邮箱格式是否正确
    if (([email length] == 0) ||
        ([password length] == 0)) {
        [self showErrorMessage:@"邮箱和密码不能为空"];
    } else {
        [self loginHandle];
    }
}

//创建一个弹出UIAlertView的方法，用来提示用户
- (void)showErrorMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

//核对用户的信息
- (void)loginHandle
{
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *gbid = @"GeekBand-I150001";

    self.loginRequest = [[GBMLoginRequest alloc] init];
    [self.loginRequest sendLoginRequestWithEmail:email password:password gbid:gbid delegate:self];
}

#pragma mark - GBMLoginRequestDelegate methods
- (void)loginRequestSuccess:(GBMLoginRequest *)request user:(GBMUserModel *)user
{
    if ([user.loginReturnMessage isEqualToString:@"Login success"]) {
        //        NSLog(@"登录成功，现在转换页面");
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate loadMainViewWithController:self];
        [GBMGlobal shareGloabl].user = user;
        [GBMGlobal shareGloabl].user.email= self.emailTextField.text;
        GBMGetImage *getimage=[[GBMGetImage alloc]init];
        [getimage sendGetImageRequest];
        

    } else {
        NSLog(@"服务器报错:%@", user.loginReturnMessage);
    }
}

- (void)loginRequestFailed:(GBMLoginRequest *)request error:(NSError *)error
{
    NSLog(@"登录错误原因:%@", error);
}

@end
