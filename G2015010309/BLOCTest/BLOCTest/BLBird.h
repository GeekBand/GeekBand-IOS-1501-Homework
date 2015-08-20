//
//  BLBird.h
//  BLOCTest
//
//  Created by HeJay on 8/10/15.
//  Copyright (c) 2015 Star. All rights reserved.
//

#import "BLAnimal.h"

@interface BLBird : BLAnimal

@property(nonatomic, copy)NSString *color;

- (void)fly:(NSString *)flyStyle;

@end
