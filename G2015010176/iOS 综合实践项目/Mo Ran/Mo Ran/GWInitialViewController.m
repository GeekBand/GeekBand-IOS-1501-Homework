//
//  GWInitialViewController.m
//  Mo Ran
//
//  Created by Will Ge on 9/13/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWInitialViewController.h"

#import "GWPostViewController.h"

@interface GWInitialViewController ()

@end

@implementation GWInitialViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Set tab bar tinit color
  self.tabBar.tintColor =
      [UIColor colorWithRed:0.9072 green:0.4144 blue:0.1985 alpha:1.0];
  self.tabBar.barTintColor =
      [UIColor colorWithRed:0.902 green:0.902 blue:0.902 alpha:1.0];

  // Set square tab bar item
  UITabBarItem *itemSquare = self.tabBar.items[0];
  [itemSquare setSelectedImage:[UIImage imageNamed:@"square_selected"]];

  // Set me tab bar item's selected image in code
  UITabBarItem *itemMe = self.tabBar.items[1];
  [itemMe setSelectedImage:[UIImage imageNamed:@"my_selected"]];

  // Add an "+" button on tab bar view
  UIButton *add = [UIButton buttonWithType:UIButtonTypeCustom];
  add.frame = CGRectMake(
      [[UIScreen mainScreen] bounds].size.width / 2 - 45 / 2,
      [[UIScreen mainScreen] bounds].size.height - 49 - 45 / 2, 45, 45);
  [add setBackgroundImage:[UIImage imageNamed:@"publish_hover"]
                 forState:UIControlStateNormal];
  [add addTarget:self
                action:@selector(addPost:)
      forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:add];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Add post
- (void)addPost:(UIButton *)sender {
  NSLog(@"add post");

  GWPostViewController *postViewContrller = [[GWPostViewController alloc] init];
  //  UINavigationController *navigationController = [[UINavigationController
  //  alloc]
  //      initWithRootViewController:postViewContrller];

  [self presentViewController:postViewContrller
                     animated:YES
                   completion:^{
                   }];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end
