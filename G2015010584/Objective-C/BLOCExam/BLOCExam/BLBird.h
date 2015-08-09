//
// Created by zzdjk6（陈圣晗） on 15/8/9.
// Copyright (c) 2015 zzdjk6（陈圣晗）. All rights reserved.
//

#import "BLAnimal.h"


@interface BLBird : BLAnimal

@property(nonatomic, strong) UIColor *color;

- (void)fly;

- (NSString *)description;

@end