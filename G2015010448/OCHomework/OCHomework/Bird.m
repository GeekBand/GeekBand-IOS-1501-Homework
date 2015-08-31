//
//  Bird.m
//  OCHomework
//
//  Created by RayBoon on 2015/08/23.
//  Copyright (c) 2015年 RayBoon. All rights reserved.
//

#import "Bird.h"

@implementation Bird

- (void)dealloc {
    
}

- (instancetype) initWithName:(NSString *)name WithWeight:(float)weight WithGender:(AnimalSex)gender WithColor:(NSString *)color {
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.gender = gender;
        self.color = color;
    }
    return self;
}


-(void)fly{
    NSLog(@"姓名为%@的小鸟，正在飞...", self.name);
}

@end
