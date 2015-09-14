//
//  WZKBird.m
//  GeekBandFirstHomeWork
//
//  Created by 王祖康 on 15/8/8.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import "WZKBird.h"

@implementation WZKBird

-(void)dealloc
{
    self.color=nil;
    
    [super dealloc];
}

#pragma mark - 方法

-(NSString *)fly
{
    return @"在飞!";
}

@end
