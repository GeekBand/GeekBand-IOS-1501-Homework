//
//  GBMMyViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/18/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMMyViewController.h"
#import "GBMGlobal.h"
#import "GBMHeadImageViewController.h"
#import "GBMNickNameViewController.h"
#import "AppDelegate.h"
@interface GBMMyViewController ()

@end

@implementation GBMMyViewController

- (void)viewDidAppear:(BOOL)animated{
    self.nickNameLabel.text=[GBMGlobal shareGlobal].user.userName;
    self.headImageView.image=[GBMGlobal shareGlobal].user.image;
    self.emailLabel.text = [GBMGlobal shareGlobal].user.email;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:237/255.0f
                                                                           green:127/255.0f
                                                                            blue:74/255.0f
                                                                           alpha:1];
    
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width / 2.0f;
    self.headImageView.clipsToBounds =YES;
}


#pragma mark - TableView Data Source methods
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat header;
    if (section == 0) {
        header = 13.0;
    }else if (section ==1){
        header = 10;
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}


#pragma mark - TableView logout methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"确定注销吗？" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *enterAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                [self dismissViewControllerAnimated:YES completion:nil];
                [GBMGlobal shareGlobal].user=nil;
                AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [appDelegate loadLoginView];
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:enterAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:true completion:nil];
            
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
