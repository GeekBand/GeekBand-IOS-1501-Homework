//
//  HJAppInfoCell.h
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJAppInfoCell : UITableViewCell

@property (nonatomic, strong) UIImageView *appImageView;
@property (nonatomic, strong) UILabel *nameLabel;

- (void)setAppName: (NSString *)aText;
- (void)setAppImage: (NSString *)aUrlString;

+ (CGFloat)calculateCellHeightWithText: (NSString *)aText;

@end
