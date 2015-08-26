//
//  Fish.m
//  OCHomework
//
//  Created by RayBoon on 2015/08/23.
//  Copyright (c) 2015年 RayBoon. All rights reserved.
//

#import "Fish.h"

@implementation Fish

- (instancetype)initWithName:(NSString *)name WithWeight:(float)weight WithGender:(AnimalSex)gender WithColor:(NSString *)color
{
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.gender = gender;
        self.color = color;
    }
    return self;
}

- (void)swimming
{
    NSLog(@"姓名为%@的小鱼，正在游...", self.name);
}

@end
