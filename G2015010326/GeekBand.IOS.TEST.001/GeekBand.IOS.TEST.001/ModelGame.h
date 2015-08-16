//
//  ModelGame.h
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelGame : NSObject

@property (nonatomic, strong) NSMutableArray * Animals;
@property (nonatomic, readonly) NSUInteger countOfHuntedBird;
@property (nonatomic, readonly) NSUInteger countOfHuntedFish;

- (void)beginGame;
- (void)huntedABird:(NSUInteger)atIndex;
- (void)huntedAfish:(NSUInteger)atIndex;

- (void)huntedFishes:(NSUInteger)number;
- (void)huntedBirds:(NSUInteger)number;
- (NSUInteger)countOfAnimals;

- (instancetype)init;
- (instancetype)initWith:(NSUInteger)_fishNumber birdNumber:(NSUInteger)_birdNumber;
@end
