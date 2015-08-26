//
//  animal.m
//  objective-chw
//
//  Created by 盛钰 on 15/8/13.
//  Copyright (c) 2015年 shengyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "animal.h"


@implementation animal


+(NSString*)sound{
    return @"动物叫～～～";
}

-(id) initWithName: (NSString*)animalName animalType:(NSString *)myAnimalType{
    
    self = [super init];
    if(self){
        
        _name = [NSString stringWithFormat:@"%@ %@",myAnimalType,animalName];
    }
    
    return self;
}

@end

