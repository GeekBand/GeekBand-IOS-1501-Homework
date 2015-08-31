//
//  HJChatCell.h
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJMessage.h"

@interface HJChatCell : UITableViewCell {
    NSString *_name;
    UILabel *_messageLabel;
    UIImageView *_backImageView;
}

@property (nonatomic, strong) UIButton *headButton;

- (void)setMessage: (NSString *)aText left: (BOOL)isLeft;
- (void)setHeadImage: (UIImage *)aImage;
- (void)setComponentsWithMessage: (HJMessage *)aMessage indexPath: (NSIndexPath *)indexPath;
- (void)cleanComponents;

+ (CGFloat)calculateCellHeightWithMessage: (HJMessage *)aMessage;

@end
