//
//  GBGlobal.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "GBMGlobal.h"
static GBMGlobal *global = nil;
@implementation GBMGlobal

+ (GBMGlobal *)shareGloabl
{
    if (global == nil) {
        global = [[GBMGlobal alloc] init];
    }
    return global;
}

@end
