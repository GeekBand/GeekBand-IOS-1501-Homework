//
//  WZDetailViewController.m
//  GeekHomework02_2
//
//  Created by Warren on 15/9/7.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZDetailViewController.h"

@interface WZDetailViewController ()

@end

@implementation WZDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.message.name;
    self.otherLabel.text = self.message.other;
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
