//
//  GBMRegisterViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/17/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMRegisterViewController.h"
#import "GBMLoginViewController.h"
#import "GBMRegisterRequest.h"

@interface GBMRegisterViewController () <GBMRegisterRequestDelegate>

@property (nonatomic,strong) GBMRegisterRequest *registerRequest;

@end

@implementation GBMRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //把注册按钮设为圆角矩形
    self.registerButton.layer.cornerRadius = 5.0;
    self.registerButton.clipsToBounds = YES;
    
    //为输入框添加代理
    self.userNameTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.repeatPasswordTextField.delegate = self;
    
    self.passwordTextField.secureTextEntry = YES;
    self.repeatPasswordTextField.secureTextEntry = YES;
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



- (IBAction)loginButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 回收键盘

//点击屏幕任何区域关闭键盘
- (IBAction)touchDownAction:(id)sender
{
    [self.userNameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.repeatPasswordTextField resignFirstResponder];
    //键盘回收后，视图恢复到原始位置
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

}

//通过代理让键盘上的return实现键盘关闭
 - (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    //键盘回收后，视图恢复到原始位置
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    return YES;
}


#pragma mark - 弹出键盘视图上移
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = self.registerButton.frame;
    int offset = frame.origin.y + 36 -(self.view.frame.size.height - 216);//键盘高度为216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    if (offset > 0) {
        self.view.frame = CGRectMake(0, -offset, self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
}


#pragma mark - 点击注册后的户输入判断
//判断邮箱地址是否合法
- (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:email];
}

//判断密码是否为6～20位的数字或字母
- (BOOL)isValidatePassword:(NSString *)password
{
    NSString *passwordRegex = @"^[a-zA-z0-9]{6,20}+$";
    NSPredicate *passwordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passwordRegex];
    return [passwordPredicate evaluateWithObject:password];
}

//创建一个Alert提示用户
- (void)showErrorMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
    [alert show];
}



#pragma mark - 点击注册button后的相关方法

- (void) registerHandle
{
    NSString *username = self.userNameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *gbid = @"GeekBand-I150001";
    
    self.registerRequest = [[GBMRegisterRequest alloc] init];
    [self.registerRequest sendRegisterRequestWithUserName:username
                                                    email:email
                                                 password:password
                                                     gbid:gbid
                                                 delegate:self];
    NSLog(@"%@",email);
}

- (IBAction)registerButtonClicked:(id)sender
{
    NSString *userName = self.userNameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *repeatPassword = self.repeatPasswordTextField.text;
    
    //验证邮箱和密码是否都有输入内容，并且检查邮箱格式是否正确
    if (([userName length] == 0) ||
        ([email length] == 0) ||
        ([password length] == 0) ||
        ([repeatPassword length] == 0)) {
        [self showErrorMessage:@"用户名、邮箱和密码均不能为空"];
    }else if (![self isValidateEmail:email]){
        [self showErrorMessage:@"您输入的邮件格式有误，请重新输入"];
    }else if (![self isValidatePassword:password]){
        [self showErrorMessage:@"您输入的密码格式有误，应为6～20位字母或数字"];
    }else if (![password isEqualToString:repeatPassword]) {
        [self showErrorMessage:@"您两次输入的密码不一致，请重新输入"];
    }else{
        [self registerHandle];
    }
}


#pragma mark - GBMRegisterRequestDelegate methods
- (void)registerRequestSuccess:(GBMRegisterRequest *)request user:(GBMUserModel *)user
{
    if ([user.registerReturnMessage isEqualToString:@"Register success"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"注册成功"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles: nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)registerRequestFailed:(GBMRegisterRequest *)request error:(NSError *)error
{
    NSLog(@"注册失败，原因:%@",error);
}







@end
