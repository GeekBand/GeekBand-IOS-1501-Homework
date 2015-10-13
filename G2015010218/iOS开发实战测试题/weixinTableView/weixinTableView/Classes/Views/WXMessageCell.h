//
//  WXMessageCell.h
//  weixinTableView
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//  聊天信息cell

#import <UIKit/UIKit.h>

@interface WXMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UIView *messageContentView;


@end
