//
//  LGlobal.m
//  Xcode_learn
//
//  Created by house on 15/8/16.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "LGlobal.h"
static LGlobal *global=nil;
@implementation LGlobal

+(LGlobal *)shareGlobal{

    if (global==nil) {
        global = [[LGlobal alloc]init];
    }
    return global;
}
@end

