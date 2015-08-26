//
//  bird.m
//  secondtest
//
//  Created by 盛钰 on 15/8/14.
//  Copyright (c) 2015年 shengyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bird.h"
#import "animal.h"

@implementation bird

+(void) fly{
    NSLog(@"飞啊飞啊飞～～～");
}

-(void)dealloc{
    NSLog(@"释放🐦%@资源",[self name]);
    [super dealloc];
}

@end