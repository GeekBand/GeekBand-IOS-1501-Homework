//
//  GBMHomePageViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMHomePageViewController.h"

@interface GBMHomePageViewController ()

@end

@implementation GBMHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showHomePage];
}

- (void)showHomePage
{
    NSString *urlString = @"http://geekband.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
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

@end
