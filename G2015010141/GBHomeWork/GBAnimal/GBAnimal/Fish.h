//
//  Fish.h
//  GBAnimal
//
//  Created by SeaHub on 15/8/9.
//  Copyright (c) 2015年 Geekband. All rights reserved.
//

#import "Animal.h"
#import <UIKit/UIKit.h>


@interface Fish : Animal

@property (strong,nonatomic) NSString *color;

-(void)fishSwim;

-(instancetype)initFishWithColor:(NSString *)aColor
                            Name:(NSString *)aName
                          Sexual:(sexual)aSex
                          Weight:(CGFloat)aWeight;


+(void)fishArrested:(NSMutableArray*)aFishes;
+(void)createFish:(NSMutableArray *)aliveArray;
@end
