//
// Created by zzdjk6（陈圣晗） on 15/8/9.
// Copyright (c) 2015 zzdjk6（陈圣晗）. All rights reserved.
//

#import "BLApp.h"
#import "BLFish.h"
#import "BLBird.h"
#import "BLAnimal+TypeCheck.h"
#import "UIColor+RandomColor.h"

// Define Macro

// You can use RANDOM_INT_0_1 to generate an int value between 0(included) to 1(included)
#define RANDOM_INT_0_1 (arc4random() % 2)

// You can use RANDOM_INT_0_100 to generate an int value between 0(included) to 100(included)
#define RANDOM_INT_0_100 (arc4random_uniform(101))

// You can use RANDOM_FLOAT_BETWEEN(lower,upper) to generate a flout value between lower(included) to upper(included)
#define RANDOM_FLOAT_BETWEEN(lower, upper) (RANDOM_INT_0_100 / 100.0f * ((upper) - (lower)) + (lower))

// Define Constants
int const kAnimalArrayLength = 20;
int const kFishAmount        = 10;
int const kBirdAmount        = 10;

@implementation BLApp
{

}

- (void)run
{
    // init animals array
    NSMutableArray *animals = [[NSMutableArray alloc] initWithCapacity:kAnimalArrayLength];

    for (int i = 0; i < kBirdAmount; i++) {
        BLBird *bird = [[BLBird alloc] init];
        bird.name   = [NSString stringWithFormat:@"Bird-%d", i];
        bird.gender = (RANDOM_INT_0_1 == 1 ? BLAnimalGenderMale : BLAnimalGenderFemale);
        bird.weight = RANDOM_FLOAT_BETWEEN([BLBird weightLowerBound], [BLBird weightUpperBound]);
        bird.color  = [UIColor randomColor];
        [animals addObject:bird];
    }

    for (int i = 0; i < kFishAmount; i++) {
        BLFish *fish = [[BLFish alloc] init];
        fish.name   = [NSString stringWithFormat:@"Fish-%d", i];
        fish.gender = (RANDOM_INT_0_1 == 1 ? BLAnimalGenderMale : BLAnimalGenderFemale);
        fish.weight = RANDOM_FLOAT_BETWEEN([BLFish weightLowerBound], [BLFish weightUpperBound]);
        fish.color  = [UIColor randomColor];
        [animals addObject:fish];
    }

    // let birds fly and let fishes swim.
    for (BLAnimal *animal in animals) {
        if ([animal isABird]) {
            BLBird *bird = (BLBird *)animal;
            [bird fly];
        } else if ([animal isAFish]) {
            BLFish *fish = (BLFish *)animal;
            [fish swim];
        }
    }

    // random hunt birds and fishes
    __block int huntedBirdCount = 0;
    __block int huntedFishCount = 0;

    [animals enumerateObjectsUsingBlock:^(BLAnimal *animal, NSUInteger idx, BOOL *stop) {
        BOOL isHunted = (RANDOM_INT_0_1 == 1);

        do {
            if (!isHunted)
                break;

            if ([animal isABird]) {
                huntedBirdCount++;
            } else if ([animal isAFish]) {
                huntedFishCount++;
            }

            NSLog(@"Animal has been hunted: %@.", animal);
            [animals removeObject:animal];
        } while (0);
    }];

    NSLog(@"%d birds are hunted.", huntedBirdCount);
    NSLog(@"%d fishes are hunted.", huntedFishCount);
    NSLog(@"There are %lu animals left: %d birds, %d fishes.", animals.count, kBirdAmount - huntedBirdCount, kFishAmount - huntedFishCount);

}

@end