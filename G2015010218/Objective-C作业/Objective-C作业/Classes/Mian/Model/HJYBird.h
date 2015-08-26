//
//  HJYBrid.h
//  Objective-C作业
//
//  Created by 黄纪银163 on 15/8/9.
//  Copyright (c) 2015年 Jiyin Huang. All rights reserved.
//  鸟

#import "HJYAnimal.h"
@class UIColor;

@interface HJYBird : HJYAnimal
/** 颜色 */
@property (nonatomic, copy) UIColor *color;

/** 飞 */
- (void) fly;
@end
