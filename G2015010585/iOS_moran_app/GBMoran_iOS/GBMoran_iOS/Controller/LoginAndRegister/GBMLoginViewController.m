//
//  GBMLoginViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/17/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMLoginViewController.h"
#import "GBMUserModel.h"
#import "GBMLoginRequest.h"
#import "GBMRegisterViewController.h"
#import "AppDelegate.h"
#import "GBMGlobal.h"
#import "GBMGetImage.h"

@interface GBMLoginViewController () <GBMLoginRequestDelegate>
@property (nonatomic,strong) GBMLoginRequest *loginRequest;

@end

@implementation GBMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.loginButton.layer.cornerRadius = 5.0;
    self.loginButton.clipsToBounds = YES;
    self.passwordTextField.secureTextEntry = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//创建一个alert，提示用户
- (void)showErrorMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}


//核对用户信息
- (void)loginHandle
{
    NSString *email     = self.userNameTextField.text;
    NSString *password  = self.passwordTextField.text;
    NSString *gbid = @"GeekBand-I150001";
    
    self.loginRequest = [[GBMLoginRequest alloc] init];
    [self.loginRequest sendLoginRequestWithEmail:email
                                        password:password
                                            gbid:gbid
                                        delegate:self];
    NSLog(@"email:%@",email);
}

#pragma mark - 登陆按钮的响应事件
- (IBAction)loginButtonClicked:(id)sender
{
    NSString *userName = self.userNameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    //验证邮箱和密码是否都有输入内容，并且检查邮箱格式是否正确
    if (([userName length] == 0) | ([password length] ==0 )) {
        [self showErrorMessage:@"邮箱和密码不能为空"];
    }else{
        [self loginHandle];
    }
}

#pragma mark - 注册按钮的响应事件
- (IBAction)registerButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"响应注册");
    
}



//通过代理来让键盘上的return实现关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
//点击屏幕的其他地方关闭键盘
- (IBAction)touchDownAction:(id)sender
{
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

#pragma mark - GBMLoginRequestDelegate methods

- (void) loginRequestSuccess:(GBMLoginRequest *)request user:(GBMUserModel *)user
{
    if ([user.loginReturnMessage isEqualToString:@"Login success"]) {
        NSLog(@"登陆成功，现在转换页面");
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [appDelegate loadMainViewWithController:self];
        [GBMGlobal shareGlobal].user = user;
        [GBMGlobal shareGlobal].user.email = self.userNameTextField.text;
        GBMGetImage *getImage = [[GBMGetImage alloc] init];
        [getImage sendGetImageRequset];
        
        
        
    }else{
        NSLog(@"服务器报错，原因：%@",user.loginReturnMessage);
    }
}

- (void) loginRequestFailed:(GBMLoginRequest *)request error:(NSError *)error
{
    NSLog(@"登陆错误原因：%@",error);
}

@end