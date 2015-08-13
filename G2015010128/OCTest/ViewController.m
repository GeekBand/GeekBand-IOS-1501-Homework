//
//  ViewController.m
//  BLOCPractice
//
//  Created by zhu yongxuan on 15/8/9.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import "ViewController.h"
#import "BLBird.h"
#import "BLFish.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *_array;
}

- (void)creatBirdAndFish
{
    for (int i = 0; i < 10; i++) {
        BLBird *bird = [[BLBird alloc] init];
        [_array addObject:bird];
        BLFish *fish = [[BLFish alloc] init];
        [_array addObject:fish];
    }
}

- (void)nslogBirdAndFish
{
    for (int i = 0; i < 20; i++) {
        id animal = _array[i];
        if ([animal isKindOfClass:[BLBird class]]) {
            [animal fly];
        } else if ([animal isKindOfClass:[BLFish class]]) {
            [animal swim];
        }
    }
}

- (void)deleteFish:(NSInteger)deleteFish AndBird:(NSInteger)deleteBird
{
    for (int i = 0; i < [_array count] && deleteBird > 0 && deleteFish > 0; i++) {
        id animal = _array[i];
        if ([animal isKindOfClass:[BLFish class]]) {
            [_array removeObject:animal];
            i--;
            deleteFish--;
        } else if ([animal isKindOfClass:[BLBird class]]) {
            [_array removeObject:animal];
            i--;
            deleteBird--;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatBirdAndFish];
    [self nslogBirdAndFish];
    NSInteger deleteFish = (arc4random() % 10) + 1;
    NSInteger deleteBird = (arc4random() % 10) + 1;
    [self deleteFish:deleteFish AndBird:deleteBird];
}


@end
