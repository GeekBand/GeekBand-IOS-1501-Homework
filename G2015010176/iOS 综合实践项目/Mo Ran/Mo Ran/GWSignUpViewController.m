//
//  GWSignUpViewController.m
//  Mo Ran
//
//  Created by Will Ge on 9/24/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWSignUpViewController.h"

#import "AppDelegate.h"
#import "GWUser.h"
#import "AFNetworking.h"
#import "networking.h"

@interface GWSignUpViewController ()

@property(weak, nonatomic) IBOutlet UITextField *userName;
@property(weak, nonatomic) IBOutlet UITextField *email;
@property(weak, nonatomic) IBOutlet UITextField *password;
@property(weak, nonatomic) IBOutlet UITextField *repeatPassword;

@end

@implementation GWSignUpViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// 注册按钮
- (IBAction)toSignUp:(UIButton *)sender {
  
  NSString *url = [NSString stringWithFormat:@"%@%@", HOST, @"user/register"];
  
  NSDictionary *patameters = @{
                               @"username" : self.userName.text,
                               @"email" : self.email.text,
                               @"password" : self.password.text,
                               @"gdid" : @"Ge Will"
                               };
  
  AFHTTPRequestOperationManager *manager =
  [AFHTTPRequestOperationManager manager];
  manager.requestSerializer = [AFJSONRequestSerializer serializer];
  manager.responseSerializer = [AFJSONResponseSerializer serializer];
  
  [manager POST:url
     parameters:patameters
        success:^(AFHTTPRequestOperation *_Nonnull operation,
                  id _Nonnull responseObject) {
          NSLog(@"Login success:%@, message:%@", responseObject,
                [responseObject objectForKey:@"message"]);
          
          if ([[responseObject objectForKey:@"status"] intValue] == 1) {
            
            // 1 - 获取用户信息
            [GWUser shareUser].email      = self.email.text;
            [GWUser shareUser].userName   = self.userName.text;
            [GWUser shareUser].userID     = [[responseObject objectForKey:@"data"] objectForKey:@"user_id"];
            [GWUser shareUser].isLogin    = YES;
            [GWUser shareUser].token      = @"";
            [GWUser shareUser].avatar     = @"";
            [GWUser shareUser].lastLogin  = @"";
            [GWUser shareUser].logintimes = @"1";
            [GWUser shareUser].projectID  = [[responseObject objectForKey:@"data"] objectForKey:@"project_id"];
            
            // 2 - 保存用户相关信息到 NSUserDefaults
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].email forKey:@"email"];
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].userName forKey:@"userName"];
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].userID forKey:@"userID"];
            [[NSUserDefaults standardUserDefaults] setBool:[GWUser shareUser].isLogin forKey:@"isLogin"];
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].token forKey:@"token"];
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].lastLogin forKey:@"lastLogin"];
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].logintimes forKey:@"loginTimes"];
            [[NSUserDefaults standardUserDefaults] setObject:[GWUser shareUser].projectID  forKey:@"projectID"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            // 3 - 视图跳转到 Main.storyboard 主界面
            AppDelegate *appDelegate =
            (AppDelegate *)[UIApplication sharedApplication].delegate;
            [appDelegate loadMainView];
          }
        }
        failure:^(AFHTTPRequestOperation *_Nonnull operation,
                  NSError *_Nonnull error) {
          NSLog(@"Login error:%@", error);
          NSLog(@"%@", operation.responseObject);
          
          __unused NSString *status =
          [operation.responseObject objectForKey:@"status"];
          __unused NSString *errorCode =
          [operation.responseObject objectForKey:@"error_code"];
          NSString *message = [operation.responseObject objectForKey:@"message"];
          
          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                          message:message
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
          [alert show];
          
        }];
}

@end
