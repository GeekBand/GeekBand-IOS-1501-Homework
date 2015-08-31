//
//  function.m
//  secondtest
//
//  Created by 盛钰 on 15/8/15.
//  Copyright (c) 2015年 shengyu. All rights reserved.
//

#if __LP64__ || TARGET_OS_EMBEDDED || TARGET_OS_IPHONE || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
typedef unsigned long NSUInteger;
#else
typedef unsigned int NSUInteger;
#endif


#import <Foundation/Foundation.h>
#import "function.h"
#import "fish.h"

@implementation function

+(void)printmesg{
    NSLog(@"hello");
}

+(id) getRandomSetFormArray: (id)array{
    //保存随机数组值下标的set
    NSMutableSet *randomSet = [[NSMutableSet alloc] init];
    
    //先确定随机数总量
  
    int arraycount = [array count];
    int randomNum = (arc4random() % arraycount)+1;
    //再获取随机数对应的数组下标
    while ([randomSet count] < randomNum) {
        int r = arc4random() % arraycount;
        [randomSet addObject:([NSNumber numberWithInt:(r)])];
    }
    
    NSLog(@"随机%i个数",randomNum);
    for (id pointer in randomSet) {
        NSLog(@"%@", pointer);
    }
    
    return randomSet;
    
}


@end
