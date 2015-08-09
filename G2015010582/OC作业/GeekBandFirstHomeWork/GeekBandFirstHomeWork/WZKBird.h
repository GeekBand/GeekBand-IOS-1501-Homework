//
//  WZKBird.h
//  GeekBandFirstHomeWork
//
//  Created by 王祖康 on 15/8/8.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import "WZKAnimal.h"

@interface WZKBird : WZKAnimal

#pragma mark - 属性

@property(nonatomic,copy)NSString *color;

#pragma mark - 方法

-(NSString *)fly;

@end
