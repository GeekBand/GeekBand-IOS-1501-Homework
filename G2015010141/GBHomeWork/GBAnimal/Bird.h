//
//  Bird.h
//  GBAnimal
//
//  Created by SeaHub on 15/8/9.
//  Copyright (c) 2015年 Geekband. All rights reserved.
//

#import "Animal.h"
#import <UIKit/UIKit.h>

@interface Bird : Animal

@property (strong,nonatomic) NSString *color;

-(void)birdFly;

-(instancetype)initBirdWithColor:(NSString *)aColor
                            Name:(NSString *)aName
                          Sexual:(sexual)aSex
                          Weight:(CGFloat)aWeight;

+(void)birdArrested:(NSMutableArray *)animalArray;

+(void)createBird:(NSMutableArray *)aliveArray;
@end
