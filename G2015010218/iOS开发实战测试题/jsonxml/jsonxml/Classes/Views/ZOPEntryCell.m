//
//  ZOPEntryCell.m
//  jsonxml
//
//  Created by 黄纪银163 on 15/8/31.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ZOPEntryCell.h"

@implementation ZOPEntryCell


- (void)awakeFromNib
{
    self.productNameLabel.numberOfLines = 0;
    self.productPrice.numberOfLines = 0;
    self.productSummaryLabel.numberOfLines =  0;
    self.productTypeLabel.numberOfLines = 0;
    
    self.iconView.layer.cornerRadius = 10.0;
    self.iconView.layer.masksToBounds = YES;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
