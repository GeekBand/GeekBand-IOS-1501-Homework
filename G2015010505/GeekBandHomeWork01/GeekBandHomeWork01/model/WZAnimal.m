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
    NSLog(@"I am %@, Sex is %@, Weight is: %li", self.name, self.gender, (long)self.weight);
}

- (NSString *)sexGender:(Sex)sex;
{
    if (sex == 1) {
        return @"male";
    } else if (sex == 2) {
        return @"female";
    }
    return @"noSex";
}

- (instancetype)initWithName:(NSString *)aName sexToGender:(Sex)aSex weight:(NSInteger)aWeight
{
    self = [super init];
    if (self) {
        self.name = aName;
        self.sex = aSex;
//        self.gender = (aSex == 1 ? @"male" : @"female"); 
        self.gender = [self sexGender:aSex];
        self.weight = aWeight;
    }
    return self;
}

@end
