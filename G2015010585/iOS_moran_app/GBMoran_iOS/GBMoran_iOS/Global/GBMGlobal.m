//
//  GBMGlobal.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMGlobal.h"
static GBMGlobal *global = nil;

@implementation GBMGlobal

+ (GBMGlobal *)shareGlobal
{
    if (global == nil) {
        global = [[GBMGlobal alloc] init];
    }
    return global;
}

@end
