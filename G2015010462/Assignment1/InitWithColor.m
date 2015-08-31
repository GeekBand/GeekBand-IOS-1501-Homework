//
//  InitWithColor.m
//  Assignment1
//
//  Created by 杨立 on 15/8/10.
//  Copyright (c) 2015年 杨立. All rights reserved.
//

#import "InitWithColor.h"

@implementation InitWithColor

-(instancetype)initWithColor:(NSString *)color WithName:(NSString *)name WithGender:(Gender)gender WithWeight:(NSUInteger)weight
{
    self = [super init];
    if (self) {
        self.name = name;
        self.gender = gender;
        self.weight = weight;
        self.color = color;
    }
    return self;
}

@end
