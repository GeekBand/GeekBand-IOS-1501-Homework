//
//  LYLogInViewController.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYLogInViewController.h"
#import "AppDelegate.h"

@interface LYLogInViewController ()

@end

@implementation LYLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)logInButtonClicked:(id)sender {
    _logInButton.backgroundColor = [UIColor cyanColor];
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate loadMainFrame];
}
@end
