//
//  WZBird.m
//  GeekBandHomeWork01
//
//  Created by Warren on 15/8/13.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZBird.h"

@implementation WZBird

- (void)birdIsFlying
{
    BOOL isFlying = arc4random() % 2;
    if (isFlying) {
        NSLog(@"I am a bird flying");
    } else {
        NSLog(@"I am a bird not flying");
    }
}

@end
