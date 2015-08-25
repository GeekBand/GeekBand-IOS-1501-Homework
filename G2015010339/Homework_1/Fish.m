//
//  Fish.m
//  Homework_1
//
//  Created by ZhouJiahui on 8/24/15.
//  Copyright (c) 2015 ZhouJiahui. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Fish.h"

@implementation Fish

-(void)dealloc
{
    self.name = nil;
    
    //[super dealloc];
}

-(NSString *)swim
{
    return @"游泳ing.......";
}
@end