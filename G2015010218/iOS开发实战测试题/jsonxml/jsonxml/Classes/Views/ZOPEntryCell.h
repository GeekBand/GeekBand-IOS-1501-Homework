//
//  ZOPEntryCell.h
//  jsonxml
//
//  Created by 黄纪银163 on 15/8/31.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZOPEntryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *productTypeLabel;

@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@property (weak, nonatomic) IBOutlet UILabel *productSummaryLabel;

@end
