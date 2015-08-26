//
//  Method1.m
//  测试
//
//  Created by 陈铭嘉 on 15/8/9.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "Method1.h"
#import "Bird.h"
#import "Fish.h"


@implementation Method1

-(void)Question4forBird:(NSMutableArray *)fisharray{

    NSInteger count = fisharray.count;
    NSInteger index = arc4random()%[fisharray count];
    for (int i = 0; i < index; i++) {
        NSInteger index1 = arc4random()%[fisharray count];
        Fish* fish = [fisharray objectAtIndex:index1];
        [fisharray removeObject:fish];
//        fish = nil;
    }
    NSLog(@"随机捞了%ld条,还剩下%ld条",(long)index,(long)count-(long)index);
}

-(void)Question4forFish:(NSMutableArray *)birdarray{
    
    NSInteger count = birdarray.count;
    NSInteger index = arc4random()%[birdarray count];
    for (int i = 0; i < index; i++) {
        NSInteger index1 = arc4random()%[birdarray count];
        Bird* bird = [birdarray objectAtIndex:index1];
        [birdarray removeObject:bird];
//        bird = nil;
    }
    NSLog(@"随机捞了%ld条,还剩下%ld条",(long)index,(long)count-(long)index);
    
}

@end
