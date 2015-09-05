//
//  ABAddMembersController.h
//  addressbook
//
//  Created by 黄纪银163 on 15/9/4.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//  添加成员的控制器

#import <UIKit/UIKit.h>

@interface ABAddMembersController : UIViewController
/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/** 名字 */
@property (weak, nonatomic) IBOutlet UITextField *nameField;
/** 电话 */
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
/** 保存按钮 */
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
/** 添加头像 */
- (IBAction)addIconImage:(id)sender;
/** 保存 */
- (IBAction)save:(id)sender;
/** 返回 */
- (IBAction)back:(id)sender;
@end
