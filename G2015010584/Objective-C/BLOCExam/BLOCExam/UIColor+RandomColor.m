//
//  UIColor+RandomColor.m
//  BLOCExam
//
//  Created by zzdjk6（陈圣晗） on 15/8/9.
//  Copyright (c) 2015年 zzdjk6（陈圣晗）. All rights reserved.
//

#import "UIColor+RandomColor.h"

static inline CGFloat randomCGFloat()
{
    return (CGFloat)arc4random() / UINT32_MAX;
}

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor
{
    return [UIColor colorWithRed:randomCGFloat()
                           green:randomCGFloat()
                            blue:randomCGFloat()
                           alpha:1.0];
}

@end