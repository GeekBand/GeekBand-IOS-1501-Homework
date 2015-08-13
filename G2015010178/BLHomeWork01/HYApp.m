//
//  HYApp.m
//  BLHomeWork01
//
//  Created by Hony on 15/8/12.
//  Copyright (c) 2015年 Hony. All rights reserved.
//

#import "HYApp.h"
#import "HYAnimal.h"
#import "HYBird.h"
#import "HYFish.h"


#define isHunted (arc4random() % 2)

@interface HYApp ()

@end

@implementation HYApp

- (void)huntBirdAndFish {
    
    NSMutableArray *animals = [[NSMutableArray alloc] init];
    
    //创建鱼和鸟，并加入到数组animals中；
    for (int i = 1; i <= 10; i++) {
        HYBird *bird = [[HYBird alloc] init];
        HYFish *fish = [[HYFish alloc] init];
        
        bird.name = [NSString stringWithFormat:@"Bird-0%d", i];
        fish.name = [NSString stringWithFormat:@"Fish-0%d", i];
        
        [animals addObject:bird];
        [animals addObject:fish];
    }
    
    //判断类，进行fly和swim动作；
    for (HYAnimal *animal in animals) {
        if ([animal isKindOfClass:[HYFish class]]) {
            HYFish *fish = (HYFish *)animal;
            [fish swim];
        }else if([animal isKindOfClass:[HYBird class]]) {
            HYBird *bird = (HYBird *)animal;
            [bird fly];
        }
    }
    
    
    //part 4：hunt
    
    __block int huntedBirdCount = 0;
    __block int huntedFishCount = 0;
    
    [animals enumerateObjectsUsingBlock:^(HYAnimal *animal, NSUInteger idx, BOOL *stop) {
        if (isHunted) {
            if ([animal isKindOfClass:[HYBird class]]) {
                huntedBirdCount++;
            }else if([animal isKindOfClass:[HYFish class]]) {
                huntedFishCount++;
            }
            NSLog(@"The animal is hunted:%@.", [animal name]);
            [animals removeObject:animal];
        }

    }];
    NSLog(@"%d birds are hunted.", huntedBirdCount);
    NSLog(@"%d fishes are hunted.", huntedFishCount);
}


@end
