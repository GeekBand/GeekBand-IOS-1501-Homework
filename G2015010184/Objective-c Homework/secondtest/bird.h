//
//  bird.h
//  secondtest
//
//  Created by 盛钰 on 15/8/14.
//  Copyright (c) 2015年 shengyu. All rights reserved.
//

#ifndef secondtest_bird_h
#define secondtest_bird_h


#endif

#import  "animal.h"

@interface bird : animal

@property (readonly) NSString *color;
+ (void) fly;
-(void)dealloc;

@end
