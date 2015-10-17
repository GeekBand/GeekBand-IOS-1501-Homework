//
//  LYTest1CustomCell1.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTest1Button1.h"
#import "LYTest1Message.h"



@protocol LYTest1CustomCell1Delegate;

@class LYTest1Button1;


@interface LYTest1CustomCell1 : UITableViewCell {
    UILabel                     *_nameLabel;
    UILabel                     *_messageLabel;
    UILabel                     *_dateLabel;
}

@property (nonatomic, strong) LYTest1Button1 *headButton;
@property (nonatomic, assign) id<LYTest1CustomCell1Delegate> delegate;
@property (nonatomic, copy) NSString *speaker;

- (void)cleanComponents;

- (void)setComponentsWithMessage:(LYTest1Message *)aMessage indexPath:(NSIndexPath *)indexPath;
- (void)setName:(NSString *)aName;
- (void)setMessage:(NSString *)aText;
- (void)setDate:(NSDate *)aDate;

- (void)setHeadImage:(UIImage *)aImage;

+ (CGFloat)calculateCellHeightWithMessage:(LYTest1Message *)aMessage;

@end


@protocol LYTest1CustomCell1Delegate <NSObject>

@optional

- (void)headButtonClicked:(LYTest1Button1 *)headButton;

@end
