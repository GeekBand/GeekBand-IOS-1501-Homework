//
//  BLAnimal.m
//  Objective-C_Homework
//
//  Created by 祝海焜 on 15/9/5.
//  Copyright (c) 2015年 祝海焜. All rights reserved.
//

#import "BLAnimal.h"

@implementation BLAnimal

-(id)initWithName:(NSString *)name
           weight:(NSInteger)weight
              sex:(SEX)sex;
{
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.animalSex = sex;
    }
    return self;
}

- (void)animalSay
{
    NSLog(@"%@在叫", self.name);
}

@end
