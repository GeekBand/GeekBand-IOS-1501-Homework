//
//  GBMNickNameViewController.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "GBMNickNameViewController.h"
#import "GBMMyViewController.h"
#import "GBMGlobal.h"

@interface GBMNickNameViewController () <GBMReNameRequestDelegate>


@end

@implementation GBMNickNameViewController
- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.nickNameTextField.text =  self.nickName;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:237 / 255.0f green:127 / 255.0f blue:74 / 255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//实现GBMReNameRequestDelegate代理方法。
//点击button时使用request请求，若成功则修改username，并返回，失败则直接返回。
- (IBAction)doneBarButtonClicked:(id)sender
{
    
    GBMReNameRequest *reNameRequest=[[GBMReNameRequest alloc]init];
    [reNameRequest sendReNameRequestWithName:self.nickNameTextField.text delegate:self];
}

-(void) renameRequestSuccess:(GBMReNameRequest *)request{
    [GBMGlobal shareGloabl].user.username=self.nickNameTextField.text;
      [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)renameRequestfail:(GBMReNameRequest *)request error:(NSError *)error{
    [self.navigationController popViewControllerAnimated:YES];
}

@end


