//
//  MyAnimal.m
//  test2
//
//  Created by john on 15/8/9.
//  Copyright (c) 2015年 john. All rights reserved.
//

#import "MyAnimal.h"

@implementation MyAnimal


- (instancetype)init {
    self = [super init];
    self.name = @"animal";
    self.sex = Others;
    self.weight = 0;
    
    return self;
}

- (void)speak {
    NSLog(@"I'm a(n) %@", self.name);
}

@end
