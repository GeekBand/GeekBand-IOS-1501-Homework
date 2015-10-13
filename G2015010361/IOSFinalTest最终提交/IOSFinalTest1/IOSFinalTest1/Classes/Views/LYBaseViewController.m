//
//  LYBaseViewController.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYBaseViewController.h"

@interface LYBaseViewController ()

@end

@implementation LYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.bgImageView.backgroundColor = [UIColor clearColor];
    self.bgImageView.image = [UIImage imageNamed:@"bgOne"];
    [self.view addSubview:self.bgImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
