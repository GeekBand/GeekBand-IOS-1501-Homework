//
//  Animal.m
//  OCHomework
//
//  Created by RayBoon on 2015/08/22.
//  Copyright (c) 2015年 RayBoon. All rights reserved.
//

#import "Animal.h"


@implementation Animal

- (instancetype) initWithName:(NSString *)name WithWeight:(float)weight WithGender:(AnimalSex)gender
{
    self = [super init];
    if (self) {
        _name = name;
        _weight = weight;
        _gender = gender;
    }
    return self;
}

- (void) say{
    NSLog(@"姓名为%@,性别为%d,体重为%f的动物, 正在叫...", self.name, self.gender, self.weight);
}

@end
