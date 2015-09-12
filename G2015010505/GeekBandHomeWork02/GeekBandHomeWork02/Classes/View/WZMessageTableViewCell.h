//
//  WZMessageTableViewCell.h
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/3.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZMessage.h"
#import "WZMessageFrame.h"

@interface WZMessageTableViewCell : UITableViewCell

@property (strong, nonatomic) WZMessageFrame *messageFrame;

+ (instancetype)messageTableViewCellWithTableView:(UITableView *)tableView;

@end
