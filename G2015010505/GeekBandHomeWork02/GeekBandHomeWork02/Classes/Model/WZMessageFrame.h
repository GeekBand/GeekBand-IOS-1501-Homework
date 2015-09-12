//
//  WZMessageFrame.h
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/3.
//  Copyright (c) 2015年 Warren. All rights reserved.
//


#define WZFontSize 15


#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>
//#import <CoreGraphics/CoreGraphics.h>
#import "WZMessage.h"

@interface WZMessageFrame : NSObject

//@property (weak, nonatomic) UILabel *timeLabelView;
//@property (weak, nonatomic) UIImageView *headView;
//@property (weak, nonatomic) UIButton *textButtonView;


@property (assign, nonatomic, readonly) CGRect timeLabelFrame;
@property (assign, nonatomic, readonly) CGRect headViewFrame;
@property (assign, nonatomic, readonly) CGRect textButtonFrame;

@property (assign, nonatomic, readonly) CGFloat rowHeight;//行高   所有只读属性不能用self  只能用_
                                                          //一定要命名为rowHeight  才能调用rowHeight method

@property (strong, nonatomic) WZMessage *message;

@property (strong, nonatomic) NSMutableArray *messageFrames;

+ (NSMutableArray *)messageFrames;


@end
