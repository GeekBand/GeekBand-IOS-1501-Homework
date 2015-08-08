//
//  GWAnimal.m
//  BLTest1
//
//  Created by Will Ge on 8/8/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWAnimal.h"

@implementation GWAnimal

- (instancetype)initWithName:(NSString *)name gender:(enum Gender)gender weight:(NSUInteger)weight {
   
    self = [super init];
    
    if (self) {
        _name = name;
        _gender = gender;
        _weight = weight;
    }
    
    return self;
}

- (void)say {
    NSLog(@"say something.");
}

@end
