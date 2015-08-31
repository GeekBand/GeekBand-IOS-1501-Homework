//
//  fish.h
//  OC作业
//
//  Created by Ryan on 15/8/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "animal.h"


@interface fish : animal
@property (nonatomic , copy) NSString * fishColor;

- (void) fishSwimming;
// 初始化fish属性
- (id) initWithName : (NSString *) name andSex : (animalSex) sex andWeight : (CGFloat)weight andColor : (NSString *) color;

@end
