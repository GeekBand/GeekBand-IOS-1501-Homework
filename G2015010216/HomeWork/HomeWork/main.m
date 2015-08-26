//
//  main.m
//  HomeWork
//
//  Created by 陈强 on 15/8/13.
//  Copyright (c) 2015年 陈强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CQBird.h"
#import "CQFish.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CQFish *theFish=[[CQFish alloc]init];
        CQBird *theBird=[[CQBird alloc]init];
        NSMutableArray *array=[NSMutableArray array];
        for (int i=0; i<10; i++) {
            NSInteger fishchar;
            NSLog(@"输入鱼的编号：");
            scanf("%li",&fishchar);
            theFish.nameNumber=[NSNumber numberWithInteger:fishchar];
            [array addObject:theFish.nameNumber];
        }
        for (int i=0; i<10; i++) {
                NSInteger birdchar;
                NSLog(@"输入鸟的编号：");
                scanf("%li",&birdchar);
                theBird.nameNumber=[NSNumber numberWithInteger:birdchar];
                [array addObject:theBird.nameNumber];
        }
        for (NSNumber *theNumber in array) {
            if ([theNumber integerValue]==[theFish.nameNumber integerValue]) {
                NSLog(@"fishname : %@",theNumber);
                [theFish fishswim];
            }
            else
                NSLog(@"birdname : %@",theNumber);
                [theBird birdFly];
        }
    }
    return 0;
}
