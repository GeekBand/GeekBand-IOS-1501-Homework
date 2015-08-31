//
//  HMBFish.m
//  Objective_C_Homework
//
//  Created by 黄穆斌 on 15/8/9.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import "HMBFish.h"

@implementation HMBFish

- (instancetype)initWithName:(NSString *)name  sex:(enum Sex)sex weight:(float)weight color:(UIColor *)color {
    self = [super initWithName:name sex:sex weight:weight];
    
    if (self) {
        _color = color;
    }
    
    return self;
}

- (void) swimming {
    NSLog(@"The fish %@ is swimming", _name);
}

@end
