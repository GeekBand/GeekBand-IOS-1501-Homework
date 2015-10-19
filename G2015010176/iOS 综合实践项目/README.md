title: 极客班项目：蓦然

date: 2015-09-20 14.00.16

---


##极客班先峰小组 蓦然项目进度

## 遇到的点

- 参考微信朋友圈,发布新照片后,动态插入原有的朋友圈顶部, 我的理解是存入本地缓存数据库,后台异步上次到服务器.

源码见 GitHub：[https://github.com/gewill/Mo-Ran](https://github.com/gewill/Mo-Ran)

## v0.1 b1
date: 2015.09.20

- 发布照片按钮 和 发布照片页面
- 复用先峰小组的 login.StoryBoard
- AppDelegate 分别实现：跳转登陆和主界面方面
## v0.1 b2
data: 2015-10-19 

- 实现注册功能
- 简单实现“我的” tab bar 
- 用户 Model，并存储到 NSUserDefaults记录登录状态

## 登陆按钮

使用 AFNetworking 的 AFHTTPRequestOperationManager 
- POST:parameters:success:failure:  方法，提交 json
格式数据，收到成功或者失败的数据 json。具体格式参考文档。

主要是处理 AFHTTPRequestOperation 的 responseObject 的 json 数据。

遇到网络问题，直接想到 Google，但是搜索的不得要领，无果。最后想到 Charles 网络调试， Request 和 Response 一目了然。非常棒的工具。

最新AFNetworking3.0.0 beta 迁移手册（AFNetworking 3.0 Migration Guide: https://github.com/AFNetworking/AFNetworking/wiki/AFNetworking-3.0-Migration-Guide）。但是实践下来，发现AFHTTPRequestOperationManager 换成 AFHTTPSessionManager 后，失败回调只有 NSURLSessionTask的 response是 NSURLResponse 类型，不在能像 2.0版本中AFHTTPRequestOperation 的responseObject ，可以直接获取response的内容，如`[operation.responseObject objectForKey:@"error_code"];`。


## v0.2 b3
data: 2015-10-19 
>进行中

- 集成高德地图，完成发布页

成功

```json
￼{￼"status": 1,￼"data": {￼"user_id": "2",￼"user_name": "testProjectNew1",￼"token": "cec5a0a5e7a1951c87099b96d16851bf6f9f0a21",￼"avatar": "",￼"project_id": "1",￼"last_login": "2015-08-30 17:35:49",￼"login_times": 3￼},￼"message": "Login success"￼}
```

失败

```json
{
	"status": 0,
	"error_code": 400,
	"message": "No such user"
}
```

登陆按钮

```objc
#pragma mark - 登陆按钮
- (IBAction)login:(UIButton *)sender {

  NSString *url = @"http://moran.chinacloudapp.cn/moran/web/user/login";

  NSDictionary *patameters = @{
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

        if ([[responseObject objectForKey:@"status"] isEqual:@"1"]) {

          // 1 - 获取用户信息
          [GWUser shareUser].userID =
              [[responseObject objectForKey:@"data"] objectForKey:@"user_id"];

          // 2 - 保存用户相关信息到 NSUserDefaults
          [[NSUserDefaults standardUserDefaults]
              setObject:[GWUser shareUser].userID
                 forKey:@"userID"];
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

```

