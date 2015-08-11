//
//  main.m
//  HomeworkForOC
//
//  Created by 孙志伟 on 15/8/10.
//  Copyright (c) 2015年 孙志伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Bird.h"
#import "Fish.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSMutableArray *animals = [NSMutableArray array];
        for (NSInteger i=0; i<10; i++) {
            Bird *bird = [[Bird alloc] init];
            bird.name = @"bird";
            Fish *fish = [[Fish alloc] init];
            fish.name = @"fish";
            [animals addObject:bird];
            [animals addObject:fish];
        }
        NSMutableArray *fishArray = [NSMutableArray array];
        NSMutableArray *birdArray = [NSMutableArray array];
        // 遍历到鸟和鱼
        for (Animal *animal in animals) {
            if ([animal isKindOfClass:[Bird class]]) {
                [birdArray addObject:animal];
                [((Bird *)animal) fly];
            } else if ([animal isKindOfClass:[Fish class]]) {
                [fishArray addObject:animal];
                [((Fish *)animal) swim];
            }
        }
        // 考虑游戏中捞鱼，随机捞到n条鱼，记录数量（被捞到鱼认为对象声明周期结束，需要从内存中释放）。打鸟同理。
        NSInteger number = (arc4random() % 10) + 1;
        NSLog(@"随机捞到（打得）%ld 条鱼（只鸟） ", number);
        for (NSInteger i=0; i<number; i++) {
            [animals removeObject:fishArray[i]];
            [animals removeObject:birdArray[i]];
        }
        NSLog(@"剩下%ld", animals.count);
    }
    
    return 0;
}





