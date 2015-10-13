//
//  ABAddressCell.m
//  addressbook
//
//  Created by 黄纪银163 on 15/9/1.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ABAddressCell.h"
@implementation ABAddressCell

- (void)awakeFromNib
{
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
}

@end
