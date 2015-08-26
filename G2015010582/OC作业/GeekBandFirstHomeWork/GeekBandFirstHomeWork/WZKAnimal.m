//
//  WZKAnimal.m
//  GeekBandFirstHomeWork
//
//  Created by 王祖康 on 15/8/8.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import "WZKAnimal.h"

@implementation WZKAnimal

-(void)dealloc
{
    self.name=nil;
    
    [super dealloc];
}

-(id)initWithName:(NSString *)newName withSex:(AnimalSex)newSex withWeight:(NSInteger)newWeight
{
    self.name=newName;
    self.sex=newSex;
    self.weight=newWeight;
    
    return self;
}

-(void)say:(NSString *)message
{
    NSLog(@"%@",message);
}

@end
