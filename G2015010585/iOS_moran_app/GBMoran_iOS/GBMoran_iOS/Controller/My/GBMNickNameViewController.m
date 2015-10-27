//
//  GBMNickNameViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/22/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMNickNameViewController.h"
#import "GBMReNameRequest.h"
#import "GBMGlobal.h"
@interface GBMNickNameViewController ()<GBMReNameRequestDelegate>

@end

@implementation GBMNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nickNameTextField.placeholder = [GBMGlobal shareGlobal].user.userName;
    self.nickNameTextField.text =  self.nickName;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:237 / 255.0f green:127 / 255.0f blue:74 / 255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)doneBarButtonClicked:(id)sender
{
    
    GBMReNameRequest *reNameRequest=[[GBMReNameRequest alloc]init];
    [reNameRequest sendReNameRequestWithName:self.nickNameTextField.text
                                    delegate:self];
    
    
}

-(void) renameRequestSuccess:(GBMReNameRequest *)request{
    [GBMGlobal shareGlobal].user.userName=self.nickNameTextField.text;
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)renameRequestFail:(GBMReNameRequest *)request error:(NSError *)error{
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
