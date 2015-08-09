//
//  WZKFish.m
//  GeekBandFirstHomeWork
//
//  Created by 王祖康 on 15/8/8.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import "WZKFish.h"

@implementation WZKFish

-(void)dealloc
{
    self.color=nil;
    
    [super dealloc];
}

-(NSString *)swim
{
    return @"在游！";
}

@end
