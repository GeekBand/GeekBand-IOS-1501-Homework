//
//  MyBird.m
//  test2
//
//  Created by john on 15/8/9.
//  Copyright (c) 2015年 john. All rights reserved.
//

#import "MyBird.h"

@implementation MyBird

- (instancetype)init {
    self = [super init];
    self.name = @"bird";
    
    return self;
}

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    self.name = [@"bird named " stringByAppendingString:name];
    
    return self;
}

- (void)fly {
    NSLog(@"I'm flying");
}

@end
