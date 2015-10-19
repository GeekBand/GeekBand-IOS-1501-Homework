//
//  GWInitialTabBarViewController.m
//  Classmates
//
//  Created by Will Ge on 9/1/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWInitialTabBarViewController.h"

@interface GWInitialTabBarViewController ()

@end

@implementation GWInitialTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set tab bar tinit color
    self.tabBar.tintColor = [UIColor colorWithRed:0.0 green:0.502 blue:0.0 alpha:1.0];
    
    
    // Set music tab bar item
    UITabBarItem *itemMusic = self.tabBar.items[1];
    itemMusic.badgeValue = [NSString stringWithFormat:@"%ld",(long)[UIApplication sharedApplication].applicationIconBadgeNumber];
    
    // Set settings tab bar item's selected image in code
    UITabBarItem *itemSettings = self.tabBar.items[2];
    [itemSettings setSelectedImage:[UIImage imageNamed:@"settings_selected"]];

    
    
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
