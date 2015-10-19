//
//  GWMyTableViewController.m
//  Mo Ran
//
//  Created by Will Ge on 10/19/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWMyTableViewController.h"
#import "GWUser.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"

@interface GWMyTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property(weak, nonatomic) IBOutlet UIImageView *avatar;
@property(weak, nonatomic) IBOutlet UILabel *name;
@property(weak, nonatomic) IBOutlet UILabel *email;

@end

@implementation GWMyTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //显示头部的用户相关信息
  [self loadInfo];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)loadInfo {
  self.name.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
  self.email.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"email"];
  
  
  if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"avatar"] isEqualToString: @"" ]) {
    
    self.avatar.image = [UIImage imageNamed:@"my"];
  } else {
    [self.avatar setImageWithURL:[[NSUserDefaults standardUserDefaults] valueForKey:@"avatar"] placeholderImage:[UIImage imageNamed:@"my"]];
  }
  
}
#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section == 0 && indexPath.row == 2) {
    [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // 2 - 视图跳转到登录界面
    AppDelegate *appDelegate =
    (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate loadLoginView];
    
  }
}

#pragma mark - Table view data source

// "Delete" the extra separator of UITableView and the last one Separator in ecah Section
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
  
  return 0.01f;
}

@end
