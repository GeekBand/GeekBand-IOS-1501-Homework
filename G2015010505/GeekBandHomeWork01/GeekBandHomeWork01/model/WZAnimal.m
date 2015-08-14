//
//  WZAnimal.m
//  GeekBandHomeWork01
//
//  Created by Warren on 15/8/13.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZAnimal.h"

@implementation WZAnimal

- (void)animalSpeak
{
    NSLog(@"I am %@, Sex is %u, Weight is: %li", self.name, self.sex, (long)self.weight);
}

- (instancetype)initWithName:(NSString *)aName Sex:(Sex)aSex weight:(NSInteger)aWeight
{
    self = [super init];
    if (self) {
        self.name = aName;
        self.sex = aSex;
        self.weight = aWeight;
    }
    return self;
}

@end
