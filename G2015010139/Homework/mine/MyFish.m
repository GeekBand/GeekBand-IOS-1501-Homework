//
//  MyFish.m
//  test2
//
//  Created by john on 15/8/9.
//  Copyright (c) 2015年 john. All rights reserved.
//

#import "MyFish.h"

@implementation MyFish

- (instancetype)init {
    self = [super init];
    self.name = @"fish";
    
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    self.name = [@"fish named " stringByAppendingString:name];
    
    return self;
}

- (void)swim {
    NSLog(@"I'm swimming");
}

@end
