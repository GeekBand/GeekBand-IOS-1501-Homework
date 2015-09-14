//
//  HMBFish.h
//  Objective_C_Homework
//
//  Created by 黄穆斌 on 15/8/9.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import "HMBAnimal.h"
#import <UIKit/UIKit.h>
@interface HMBFish : HMBAnimal {
    UIColor * _color;
}

@property UIColor * color;

- (instancetype)initWithName:(NSString *)name  sex:(enum Sex)sex weight:(float)weight color:(UIColor *)color;

- (void) swimming;

@end
