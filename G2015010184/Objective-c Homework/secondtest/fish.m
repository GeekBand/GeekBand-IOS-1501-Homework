//
//  fish.m
//  secondtest
//
//  Created by 盛钰 on 15/8/14.
//  Copyright (c) 2015年 shengyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fish.h"

@implementation fish

+(void) swim{
    NSLog(@"游啊游啊游～～～");
}

-(void) dealloc{
    NSLog(@"释放🐟%@内存",[self name]);
    //self.name = nil;
    // self = nil;
    [super dealloc];
   
}
@end