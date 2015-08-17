//
//  LEIAnimals.m
//  IOS homeWork
//
//  Created by 雷源 on 15/8/14.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LEIAnimals.h"

@implementation LEIAnimals

-(instancetype)initWithName:(NSString *)name Weight:(CGFloat)weight Gender:(LEIAnimalsGender)gender
{
    self = [super init];//super = NSObject
    if (self){
        _weight = weight;
        _name = [name copy];//避免指针问题
        _animalsGender = gender;
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"%@ has been captured.", self.name);
}

- (void)crying
{
    NSLog(@"%@ is crying",self.name);
}

- (void)printInfo
{
    NSLog(@"name:%@\t weight:%f \t gender:%u ", self.name, self.weight, self.animalsGender);
}
@end

