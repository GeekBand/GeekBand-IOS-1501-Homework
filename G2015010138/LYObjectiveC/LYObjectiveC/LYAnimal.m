//
//  LYAnimal.m
//  LYObjectiveC
//
//  Created by zero on 15/8/8.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "LYAnimal.h"

@implementation LYAnimal

- (instancetype)initWithName:(NSString *)name andWeight:(NSInteger)weight sex:(animalSex)sex{
    self = [super init];
    if (self) {
        _name = name;
        _weight = weight;
        _sex = (sex == male ? @"male" : @"female");
    }
    return self;
}

- (void)makeSound{
    NSLog(@"Animal can make sounds");
}

@end
