//
//  BLAnimal+TypeCheck.m
//  BLOCExam
//
//  Created by zzdjk6（陈圣晗） on 15/8/9.
//  Copyright (c) 2015年 zzdjk6（陈圣晗）. All rights reserved.
//

#import "BLAnimal+TypeCheck.h"
#import "BLFish.h"
#import "BLBird.h"

@implementation BLAnimal (TypeCheck)

- (BOOL)isAFish
{
    return [self isKindOfClass:[BLFish class]];
}

- (BOOL)isABird
{
    return [self isKindOfClass:[BLBird class]];
}


@end
