//
//  Bird.m
//  测试
//
//  Created by 陈铭嘉 on 15/8/8.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "Bird.h"

@implementation Bird


-(instancetype)initWithName:(NSString *)name WithWeight:(NSUInteger)weight WithSex:(sex )sex WithColor:(NSString *)color
{
    self = [super initWithName:name WithWeight:weight WithSex:sex];
    if (self) {
        self.color = color;
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name WithWeight:(NSUInteger)weight WithSex:(sex )sex
{
    self = [self initWithName:name WithWeight:weight WithSex:0 WithColor:@"无"];
    return self;
}

-(instancetype)init{
    self = [self initWithName:@"无" WithWeight:0 WithSex:0 WithColor:@"无"];
    return self;
}

-(void)Fly{
    NSLog(@"我在飞~~~~");
}

@end
