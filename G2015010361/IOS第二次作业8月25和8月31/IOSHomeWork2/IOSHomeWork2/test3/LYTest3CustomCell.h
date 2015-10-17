//
//  LYTest3CustomCell.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/16.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTest3Message.h"


@protocol LYTest3CustomCellDelegate;

@class LYTest3Message;


@interface LYTest3CustomCell : UITableViewCell {
    UILabel                     *_nameLabel;
    UILabel                     *_messageLabel;
    UIImageView                 *_headImage;
    UIButton                    *_headButton;
}

@property (nonatomic, assign) id<LYTest3CustomCellDelegate> delegate;

- (void)cleanComponents;

- (void)setComponentsWithMessage:(LYTest3Message *)aMessage indexPath:(NSIndexPath *)indexPath;
- (void)setName:(NSString *)aName;
- (void)setMessage:(NSString *)aText;

- (void)setHeadImage:(UIImage *)aImage;

+ (CGFloat)calculateCellHeightWithMessage:(LYTest3Message *)aMessage;

@end


@protocol LYTest3CustomCellDelegate <NSObject>

@optional

@end