//
//  Animal.m
//  Homework_1
//
//  Created by ZhouJiahui on 8/17/15.
//  Copyright (c) 2015 ZhouJiahui. All rights reserved.
//


#import "Animal.h"

@implementation Animal

- (void)dealloc
{
    self.name = nil;
    
    //[super dealloc];
}

-(id)initWithName:(NSString *)name Sex:(sex)sex Weight:(NSInteger)weight
{
    self.name = name;
    self.sex = sex;
    self.weight = weight;
    
    return self;
}

-(void)say:(NSString *)message
{
    NSLog(@"%@",message);
}

@end
