//
//  HJYAnimal.m
//  Objective-C作业
//
//  Created by 黄纪银163 on 15/8/9.
//  Copyright (c) 2015年 Jiyin Huang. All rights reserved.
//

#import "HJYAnimal.h"

@implementation HJYAnimal


- (void)phonation
{
    NSLog(@"%@ 发声 .",self.name);
}

- (void)dealloc
{
    self.name = nil;
}
@end
