//
//  GWFish.h
//  BLTest1
//
//  Created by Will Ge on 8/8/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWAnimal.h"
#import <UIKit/UIKit.h>

@interface GWFish : GWAnimal


@property (nonatomic, copy, readwrite) UIColor *color;



- (void)swim;

@end
