//
//  Fish.m
//  oc1
//
//  Created by ZHY on 15/8/8.
//  Copyright (c) 2015年 ZHY. All rights reserved.
//

#import "Fish.h"

@implementation Fish
+(void)swim{
    NSLog(@"游");
}
+(NSInteger)hunt{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    int value =arc4random_uniform(100);
    for (int i=0; i<value; i++) {
        Fish  *fish=[[Fish alloc]init];
        [array addObject:fish];
        
    }
    NSInteger count=[array count];
    [array removeAllObjects];
    return count;
}
@end
