//
//  Bird.m
//  oc1
//
//  Created by ZHY on 15/8/8.
//  Copyright (c) 2015年 ZHY. All rights reserved.
//

#import "Bird.h"

@implementation Bird
+(void)fly{
    NSLog(@"飞");
}
+(NSInteger)hunt{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    int value =arc4random_uniform(100);
    for (int i=0; i<value; i++) {
        Bird  *bird=[[Bird alloc]init];
        [array addObject:bird];
        
    }
    NSInteger count=[array count];
    [array removeAllObjects];
    return count;
}
@end
