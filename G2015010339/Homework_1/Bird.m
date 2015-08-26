//
//  Bird.m
//  Homework_1
//
//  Created by ZhouJiahui on 8/24/15.
//  Copyright (c) 2015 ZhouJiahui. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Bird.h"

@implementation Bird

-(void)dealloc
{
    self.color = nil;
    
    //[super dealloc];
}

-(NSString *)fly
{
    return @"鸟飞ing......../n";
}

@end