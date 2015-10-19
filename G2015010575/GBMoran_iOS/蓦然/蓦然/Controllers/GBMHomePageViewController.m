//
//  GBMHomePageViewController.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "GBMHomePageViewController.h"

@interface GBMHomePageViewController ()

@end

@implementation GBMHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showHomePage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showHomePage
{
    NSString *urlString = @"http://geekband.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


@end
