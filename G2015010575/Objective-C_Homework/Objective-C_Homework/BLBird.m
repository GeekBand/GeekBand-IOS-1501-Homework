//
//  BLBird.m
//  Objective-C_Homework
//
//  Created by 祝海焜 on 15/9/5.
//  Copyright (c) 2015年 祝海焜. All rights reserved.
//

#import "BLBird.h"

@implementation BLBird

-(id)initWithName:(NSString *)name weight:(NSInteger)weight sex:(SEX)sex color:(UIColor *)color
{
    self =[super initWithName:name weight:weight sex:sex];
    if (self) {
        self.color = color;
    }
    return  self;
}

- (void)fly
{
    NSLog(@"%@在飞",self.name);
}

@end
