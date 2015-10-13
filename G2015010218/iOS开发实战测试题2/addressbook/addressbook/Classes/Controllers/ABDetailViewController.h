//
//  ABDetailViewController.h
//  addressbook
//
//  Created by 黄纪银163 on 15/9/1.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//  通讯录详情页

#import <UIKit/UIKit.h>
#import "ABSchoolmate.h"

@interface ABDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

/** 详细个人信息 */
@property (nonatomic, strong) ABSchoolmate *schoolmate;

@end
