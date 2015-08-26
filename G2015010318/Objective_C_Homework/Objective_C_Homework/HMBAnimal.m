//
//  Animal.m
//  Objective_C_Homework
//
//  Created by 黄穆斌 on 15/8/9.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import "HMBAnimal.h"

@implementation HMBAnimal

- (instancetype) initWithName:(NSString * )name sex:(enum Sex)sex weight:(float)weight {
    self = [super init];
    
    if (self) {
        _name   = name;
        _sex    = sex;
        _weight = weight;
    }
    
    return self;
}


- (void) sounding {
    NSLog(@"This is %@'s sound.", _name);
}

@end
