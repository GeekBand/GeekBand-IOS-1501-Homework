//
//  SendMessageToWeiboViewController.m
//  WeiboSDKDemo
//
//  Created by Wade Cheng on 3/29/13.
//  Copyright (c) 2013 SINA iOS Team. All rights reserved.
//

#import "SendMessageToWeiboViewController.h"
#import "HttpRequestDemoTableViewController.h"
#import "AppDelegate.h"
#import "WeiboSDK.h"


@interface SendMessageToWeiboViewController()<UIScrollViewDelegate>
{
    WBSDKRelationshipButton *relationshipButton;
    WBSDKCommentButton *commentButton;
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UISwitch *textSwitch;
@property (nonatomic, strong) UISwitch *imageSwitch;
@property (nonatomic, strong) UISwitch *mediaSwitch;

@end

@implementation SendMessageToWeiboViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 3;
    [scrollView addSubview:self.titleLabel];
    self.titleLabel.text = NSLocalizedString(@"8.9.10题", nil);
    
    UILabel *loginTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 70, 290, 20)];
    loginTextLabel.text = NSLocalizedString(@"登录:", nil);
    loginTextLabel.backgroundColor = [UIColor clearColor];
    loginTextLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:loginTextLabel];
    
    UIButton *ssoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ssoButton setTitle:NSLocalizedString(@"请求微博认证（SSO授权）", nil) forState:UIControlStateNormal];
    [ssoButton addTarget:self action:@selector(ssoButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    ssoButton.frame = CGRectMake(20, 90, 280, 40);
    [scrollView addSubview:ssoButton];
    
    UIButton *ssoOutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [ssoOutButton setTitle:NSLocalizedString(@"登出", nil) forState:UIControlStateNormal];
    [ssoOutButton addTarget:self action:@selector(ssoOutButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    ssoOutButton.frame = CGRectMake(20, 130, 280, 40);
    [scrollView addSubview:ssoOutButton];
    

    
//    self.shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.shareButton.titleLabel.numberOfLines = 2;
//    self.shareButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//    [self.shareButton setTitle:NSLocalizedString(@"分享消息到微博", nil) forState:UIControlStateNormal];
//    [self.shareButton addTarget:self action:@selector(shareButtonPressed) forControlEvents:UIControlEventTouchUpInside];
//    self.shareButton.frame = CGRectMake(210, 200, 90, 110);
//    [scrollView addSubview:self.shareButton];
//    
//    UILabel *paymentTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 320, 290, 20)];
//    paymentTextLabel.text = NSLocalizedString(@"支付:", nil);
//    paymentTextLabel.backgroundColor = [UIColor clearColor];
//    paymentTextLabel.textAlignment = NSTextAlignmentLeft;
//    [scrollView addSubview:paymentTextLabel];
//    
//    UIButton *payButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [payButton setTitle:NSLocalizedString(@"支付", nil) forState:UIControlStateNormal];
//    [payButton addTarget:self action:@selector(payButtonPressed) forControlEvents:UIControlEventTouchUpInside];
//    payButton.frame = CGRectMake(20, 340, 280, 40);
//    [scrollView addSubview:payButton];
    
    UILabel *httpRequestLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 190, 290, 20)];
    httpRequestLabel.text = NSLocalizedString(@"Open API:", nil);
    httpRequestLabel.backgroundColor = [UIColor clearColor];
    httpRequestLabel.textAlignment = NSTextAlignmentLeft;
    [scrollView addSubview:httpRequestLabel];
    
    UIButton *openAPIButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [openAPIButton setTitle:NSLocalizedString(@"调用OpenAPI", nil) forState:UIControlStateNormal];
    [openAPIButton addTarget:self action:@selector(requestOpenAPI) forControlEvents:UIControlEventTouchUpInside];
    openAPIButton.frame = CGRectMake(20, 210, 280, 40);
    [scrollView addSubview:openAPIButton];
    
//    UILabel *otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 520, 290, 20)];
//    otherLabel.text = NSLocalizedString(@"Others:", nil);
//    otherLabel.backgroundColor = [UIColor clearColor];
//    otherLabel.textAlignment = NSTextAlignmentLeft;
//    [scrollView addSubview:otherLabel];
    
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    relationshipButton = [[WBSDKRelationshipButton alloc] initWithFrame:CGRectMake(20, 550, 140, 30) accessToken:myDelegate.wbtoken currentUser:myDelegate.wbCurrentUserID followUser:@"2002619624" completionHandler:^(WBSDKBasicButton *button, BOOL isSuccess, NSDictionary *resultDict) {
        
        NSString* accessToken = [resultDict objectForKey:@"access_token"];
        if (accessToken)
        {
            myDelegate.wbtoken = accessToken;
        }
        NSString* uid = [resultDict objectForKey:@"uid"];
        if (uid)
        {
            myDelegate.wbCurrentUserID = uid;
        }
        
        
    }];
    
    [scrollView addSubview:relationshipButton];
    
    UIButton *checkRelationShipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [checkRelationShipButton setTitle:NSLocalizedString(@"刷新关注状态", nil) forState:UIControlStateNormal];
    [checkRelationShipButton addTarget:self action:@selector(checkRelationShipButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    checkRelationShipButton.frame = CGRectMake(180, 550, 140, 30);
    [scrollView addSubview:checkRelationShipButton];
    
    
    commentButton = [[WBSDKCommentButton alloc] initWithFrame:CGRectMake(20, 580, 140, 30) accessToken:myDelegate.wbtoken keyword:@"后会无期" urlString:@"" category:@"1001" completionHandler:^(WBSDKBasicButton *button, BOOL isSuccess, NSDictionary *resultDict) {
        
        NSString* accessToken = [resultDict objectForKey:@"access_token"];
        if (accessToken)
        {
            myDelegate.wbtoken = accessToken;
        }
        NSString* uid = [resultDict objectForKey:@"uid"];
        if (uid)
        {
            myDelegate.wbCurrentUserID = uid;
        }
        
    }];
    [scrollView addSubview:commentButton];
    
    UIButton *checkCommentButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [checkCommentButton setTitle:NSLocalizedString(@"刷新评论按钮", nil) forState:UIControlStateNormal];
    [checkCommentButton addTarget:self action:@selector(checkCommentButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    checkCommentButton.frame = CGRectMake(180, 580, 140, 30);
    [scrollView addSubview:checkCommentButton];
    
    
    
    UIButton *appRecomendButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [appRecomendButton1 setTitle:NSLocalizedString(@"私信app推荐1", nil) forState:UIControlStateNormal];
    [appRecomendButton1 addTarget:self action:@selector(appRecommendButton1Pressed) forControlEvents:UIControlEventTouchUpInside];
    appRecomendButton1.frame = CGRectMake(20, 610, 130, 50);
    [scrollView addSubview:appRecomendButton1];
    
    UIButton *appRecomendButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [appRecomendButton2 setTitle:NSLocalizedString(@"私信app推荐2", nil) forState:UIControlStateNormal];
    [appRecomendButton2 addTarget:self action:@selector(appRecommendButton2Pressed) forControlEvents:UIControlEventTouchUpInside];
    appRecomendButton2.frame = CGRectMake(170, 610, 130, 50);
    [scrollView addSubview:appRecomendButton2];
    
    UIButton *messageRegisterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [messageRegisterButton setTitle:NSLocalizedString(@"短信注册测试", nil) forState:UIControlStateNormal];
    [messageRegisterButton addTarget:self action:@selector(messageRegisterPressed) forControlEvents:UIControlEventTouchUpInside];
    messageRegisterButton.frame = CGRectMake(20, 660, 130, 50);
    [scrollView addSubview:messageRegisterButton];
    
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 700)];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    [super viewWillDisappear:animated];
}

- (void) messageRegisterPressed
{
    [WeiboSDK messageRegister:@"验证码登陆"];
}



- (void)appRecommendButton1Pressed
{
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSArray* uids = nil;//[[NSArray alloc]initWithObjects:@"1111",@"2222",@"3333",nil];
    
    WBSDKAppRecommendRequest *request = [WBSDKAppRecommendRequest requestWithUIDs:uids access_token:myDelegate.wbtoken];
    request.userInfo = @{@"ShareMessageFrom": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)appRecommendButton2Pressed
{
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSString* aTestUserID = @"3320390445";
    NSArray* uids = [[NSArray alloc] initWithObjects:aTestUserID, nil];
    
    WBSDKAppRecommendRequest *request = [WBSDKAppRecommendRequest requestWithUIDs:uids access_token:myDelegate.wbtoken];
    request.userInfo = @{@"ShareMessageFrom": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)ssoButtonPressed
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = KRedirectURL;//KRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)ssoOutButtonPressed
{
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    [WeiboSDK logOutWithToken:myDelegate.wbtoken delegate:self withTag:@"user1"];
}

//- (void)payButtonPressed
//{
//    WBOrderObject *order = [[WBOrderObject alloc] init];
//    [order setOrderString:@"type=test"];
//    
//    WBPaymentRequest *request = [WBPaymentRequest requestWithOrder:order];
//    [WeiboSDK sendRequest:request];
//}

- (void)requestOpenAPI
{
    HttpRequestDemoTableViewController* httpRequestDemoVC = [[HttpRequestDemoTableViewController alloc] initWithStyle:UITableViewStyleGrouped];

    [self presentViewController:httpRequestDemoVC animated:YES completion:^{
    }];
    
}

- (void)checkCommentButtonPressed
{
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    commentButton.accessToken = myDelegate.wbtoken;
}

- (void)checkRelationShipButtonPressed
{
    AppDelegate *myDelegate =(AppDelegate*)[[UIApplication sharedApplication] delegate];
    relationshipButton.accessToken = myDelegate.wbtoken;
    relationshipButton.currentUserID = myDelegate.wbCurrentUserID;
    [relationshipButton checkCurrentRelationship];
}


#pragma mark -
#pragma WBHttpRequestDelegate

- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result
{
    NSString *title = nil;
    UIAlertView *alert = nil;
    
    title = NSLocalizedString(@"收到网络回调", nil);
    alert = [[UIAlertView alloc] initWithTitle:title
                                       message:[NSString stringWithFormat:@"%@",result]
                                      delegate:nil
                             cancelButtonTitle:NSLocalizedString(@"确定", nil)
                             otherButtonTitles:nil];
    [alert show];
}

- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error;
{
    NSString *title = nil;
    UIAlertView *alert = nil;
    
    title = NSLocalizedString(@"请求异常", nil);
    alert = [[UIAlertView alloc] initWithTitle:title
                                       message:[NSString stringWithFormat:@"%@",error]
                                      delegate:nil
                             cancelButtonTitle:NSLocalizedString(@"确定", nil)
                             otherButtonTitles:nil];
    [alert show];
}

#pragma mark - 
#pragma Internal Method

- (WBMessageObject *)messageToShare
{
    WBMessageObject *message = [WBMessageObject message];
    
    if (self.textSwitch.on)
    {
        message.text = NSLocalizedString(@"测试通过WeiboSDK发送文字到微博!", nil);
    }
    
    if (self.imageSwitch.on)
    {
        WBImageObject *image = [WBImageObject object];
        image.imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_1" ofType:@"jpg"]];
        message.imageObject = image;
    }
    
    if (self.mediaSwitch.on)
    {
        WBWebpageObject *webpage = [WBWebpageObject object];
        webpage.objectID = @"identifier1";
        webpage.title = NSLocalizedString(@"分享网页标题", nil);
        webpage.description = [NSString stringWithFormat:NSLocalizedString(@"分享网页内容简介-%.0f", nil), [[NSDate date] timeIntervalSince1970]];
        webpage.thumbnailData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_2" ofType:@"jpg"]];
        webpage.webpageUrl = @"http://sina.cn?a=1";
        message.mediaObject = webpage;
    }
    
    return message;
}


@end
