//
//  WXMessageCell.m
//  weixinTableView
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "WXMessageCell.h"

@implementation WXMessageCell

- (void)awakeFromNib {
    
    self.messageLabel.textAlignment = NSTextAlignmentLeft;
    
    self.userIcon.contentMode = UIViewContentModeScaleAspectFit;
    
    self.messageContentView.layer.cornerRadius = 5.0;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
