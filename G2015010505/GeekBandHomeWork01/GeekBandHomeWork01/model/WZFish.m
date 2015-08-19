//
//  WZFish.m
//  GeekBandHomeWork01
//
//  Created by Warren on 15/8/13.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZFish.h"

@implementation WZFish

- (void)fishIsSwimming
{
    BOOL isSwimming = arc4random() % 2;
    if (isSwimming) {
        NSLog(@"I am a fish swimming");
    } else {
        NSLog(@"I am a fish not Swimming");
    }
}

@end
