//
//  LYTwoViewController.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTwoViewController.h"
#define kTwoAlertViewTag        200

@interface LYTwoViewController ()

@end

@implementation LYTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Web View";
    self.bgImageView.image = [UIImage imageNamed:@"bgTwo"];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, width, height - 64 - 49 - 44)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    NSString *URLString = @"http://www.youku.com";
    
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    [_webView loadRequest:request];
    
    _activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, (width - 20) / 2, 20, 20)];
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _activityView.hidesWhenStopped = YES;
    [self.view addSubview:_activityView];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, _webView.frame.origin.y + _webView.frame.size.height, width, 44)];
    [self.view addSubview:toolBar];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(backButtonClicked:)];
    
    UIBarButtonItem *forwardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(forwardButtonClicked:)];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshButtonClicked:)];
    
    UIBarButtonItem *fixedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedButton.width = 80;
    
    UIBarButtonItem *flexibleButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolBar setItems:[NSArray arrayWithObjects:backButton, fixedButton, forwardButton, flexibleButton, refreshButton, nil]];//注意这几个的位置 中间隔的fix flexible
}

#pragma mark - Custom event methods

- (void)backButtonClicked:(UIBarButtonItem *)button
{
    if ([_webView canGoBack]) {
        [_webView goBack];
    }
}

- (void)forwardButtonClicked:(UIBarButtonItem *)button
{
    if ([_webView canGoForward]) {
        [_webView goForward];
    }
}

- (void)refreshButtonClicked:(UIBarButtonItem *)button
{
    [_webView reload];
}

#pragma mark - UIWebViewDelegate methods

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{

        return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activityView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activityView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error//打不开时弹出alertview
{
    [_activityView stopAnimating];
    NSLog(@"%@", error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"打开失败"
                                                    message:@"网络有问题 "
                                                   delegate:self
                                          cancelButtonTitle:@"ok"
                                          otherButtonTitles: nil];
    alert.tag = kTwoAlertViewTag;
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
