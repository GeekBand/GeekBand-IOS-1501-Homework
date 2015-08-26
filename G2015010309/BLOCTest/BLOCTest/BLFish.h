//
//  BLFish.h
//  BLOCTest
//
//  Created by HeJay on 8/10/15.
//  Copyright (c) 2015 Star. All rights reserved.
//

#import "BLAnimal.h"

@interface BLFish : BLAnimal

@property(nonatomic, copy)NSString *color;

- (void)swim : (NSString *)swimStyle;

@end
