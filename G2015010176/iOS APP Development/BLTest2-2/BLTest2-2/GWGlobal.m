//
//  GWGlobal.m
//  BLDemo05 L21
//
//  Created by Will Ge on 8/21/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWGlobal.h"

static GWGlobal *global = nil;

@implementation GWGlobal

+ (GWGlobal *)shareGlobal {
    
    if (global == nil) {
        global = [[GWGlobal alloc] init];
    }
    
    return global;
}

@end
