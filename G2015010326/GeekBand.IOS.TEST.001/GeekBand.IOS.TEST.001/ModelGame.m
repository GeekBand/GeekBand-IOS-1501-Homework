//
//  ModelGame.m
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "ModelGame.h"
#import "AsModelFish.h"
#import "AsModelBird.h"

const NSUInteger kDefaultBirdAmount = 10;
const NSUInteger kDefaultFishAmount = 10;

@implementation ModelGame
@synthesize countOfHuntedFish = _countOfHuntedFish, countOfHuntedBird = _countOfHuntedBird;

- (NSMutableArray*)Animals
{
    if (!_Animals) {
        _Animals = [NSMutableArray array];
    }
    return _Animals;
}

#pragma function for init

- (instancetype)initWith:(NSUInteger)_fishNumber birdNumber:(NSUInteger)_birdNumber
{
    self = [super init];
    if (self) {
        for (int index = 0; index < _fishNumber; index++) {
            [self.Animals addObject:[[AsModelFish alloc] initWith:[NSString stringWithFormat:@"%i", index] gender:ASAnimalGenderMale weight:arc4random() % _fishNumber]];
        }
        for (int index = 0; index < _birdNumber; ++index) {
            [self.Animals addObject:[[AsModelBird alloc] initWith:[NSString stringWithFormat:@"%i", index] gender:ASAnimalGenderFemale weight:arc4random() % _birdNumber]];
        }
        [self beginGame];
    }
    return  self;
}

- (instancetype)init
{
    return [[ModelGame alloc] initWith:kDefaultFishAmount birdNumber:kDefaultBirdAmount];
}

#pragma count
- (NSUInteger)countOfAnimals
{
    return [self.Animals count];
}

- (NSUInteger)countOfHuntedBird
{
    if (!_countOfHuntedFish) {
        _countOfHuntedFish = 0;
    }
    return _countOfHuntedFish;
}

- (NSUInteger)countOfHuntedFish
{
    if(!_countOfHuntedBird)
    {
        _countOfHuntedBird = 0;
    }
    return _countOfHuntedBird;
}

- (NSUInteger)countOfBird
{
    NSUInteger count = 0;
    for (id _ in self.Animals) {
        if ([_ isKindOfClass:[AsModelBird class]]) {
            count++;
        }
    }
    return count;
}

- (NSUInteger)countOfFish
{
    NSUInteger count = 0;
    for (id _ in self.Animals) {
        if ([_ isKindOfClass:[AsModelFish class]]) {
            count++;
        }
    }
    return count;
}

- (void)beginGame
{
    for (int index = 0; index < self.countOfAnimals; ++index) {
        [self.Animals exchangeObjectAtIndex:index withObjectAtIndex:arc4random_uniform(index + 1)];
    }
    NSLog(@"%@", self);
    for (id _ in self.Animals) {
        if ([_ isKindOfClass:[AsModelBird class]]) {
            [_ flying];
        }
        if ([_ isKindOfClass:[AsModelFish class]]) {
            [_ swimming];
        }
    }
}

-(NSString*)description
{
    NSMutableString * description = [[NSMutableString alloc] init];
    [description appendString:@"=================================\r\n"];
    [description appendFormat:@"hunted bird:%lu \r\n", self.countOfHuntedBird];
    [description appendFormat:@"hunted fish:%lu \r\n", self.countOfHuntedFish];
    [description appendFormat:@"bird left:%lu \r\n", [self countOfBird]];
    [description appendFormat:@"fish left:%lu \r\n", [self countOfFish]];
    [description appendString:@"================================="];
    return description;
}

- (void)shuffle
{
    for (int index = 0; index < self.countOfAnimals; ++index) {
        [self.Animals exchangeObjectAtIndex:index withObjectAtIndex:arc4random() % self.countOfAnimals];
    }
}

- (void)huntedBirds:(NSUInteger)number
{
    [self shuffle];
    
    for (int index = 0; index < number; ++index) {
        int tempIndex = arc4random() % self.countOfAnimals;
        [self huntedABird:tempIndex];
    }
    NSLog(@"%@", self);
}

- (void)huntedFishes:(NSUInteger)number
{
    [self shuffle];
    for (int index = 0; index < number; ++index) {
        int tempIndex = arc4random() % self.countOfAnimals;
        [self huntedAfish:tempIndex];
    }
    NSLog(@"%@", self);
}

- (void)huntedABird:(NSUInteger)atIndex
{
    if ([self countOfAnimals] <= atIndex) {
        return;
    }
    
    if ([self countOfBird] <= 0) {
        return;
    }
    id _ = [self.Animals objectAtIndex:atIndex];
    if ([_ isKindOfClass:[AsModelBird class]]) {
        [self.Animals removeObjectAtIndex:atIndex];
        _countOfHuntedBird++;
        NSLog(@"bird: %@ hunted!!!", _);
        _ = nil;
    }
}

- (void)huntedAfish:(NSUInteger)atIndex
{
    if ([self countOfAnimals] <= atIndex) {
        return;
    }
    
    if ([self countOfFish] <= 0) {
        return;
    }
    
    id _ = [self.Animals objectAtIndex:atIndex];
    if ([_ isKindOfClass:[AsModelFish class]]) {
        [self.Animals removeObjectAtIndex:atIndex];
        _countOfHuntedFish++;
        NSLog(@"fish: %@ hunted!!!", _);
        _ = nil;
    }
}


@end
