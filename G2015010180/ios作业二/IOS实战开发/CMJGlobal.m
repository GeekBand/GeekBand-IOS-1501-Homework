//
//  CMJGlobal.m
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/27.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "CMJGlobal.h"

@implementation CMJGlobal

static CMJGlobal *global = nil;

+ (CMJGlobal *)shareGloabl
{
    if (global == nil) {
        global = [[CMJGlobal alloc] init];
    }
    return global;
}

@end
