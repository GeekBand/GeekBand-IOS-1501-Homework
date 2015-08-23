//
//  LEIFishes.m
//  IOS homeWork
//
//  Created by 雷源 on 15/8/14.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LEIFishes.h"

@implementation LEIFishes

-(void)swimming{
    NSLog(@"%@ is swiming", self.name);
}
- (void)printInfo
{
    NSLog(@"name:%@\t weight:%f \t gender:%u \t color%u ", self.name, self.weight, self.animalsGender, self.color);
}
@end
