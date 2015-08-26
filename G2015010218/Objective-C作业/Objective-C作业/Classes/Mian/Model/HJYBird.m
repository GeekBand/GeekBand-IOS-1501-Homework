//
//  HJYBrid.m
//  Objective-C作业
//
//  Created by 黄纪银163 on 15/8/9.
//  Copyright (c) 2015年 Jiyin Huang. All rights reserved.
//

#import "HJYBird.h"

@implementation HJYBird


- (void)fly
{
    NSLog(@"%@ flying",self.name);
}

- (void)dealloc
{
    NSLog(@"%@ dealloc",self.name);
    self.color = nil;
}
@end
