//
//  HJYFish.h
//  Objective-C作业
//
//  Created by 黄纪银163 on 15/8/9.
//  Copyright (c) 2015年 Jiyin Huang. All rights reserved.
//

#import "HJYAnimal.h"
@class UIColor;
@interface HJYFish : HJYAnimal
/** 颜色 */
@property (nonatomic, copy) UIColor *color;

/** 游 */
- (void) swim;
@end
