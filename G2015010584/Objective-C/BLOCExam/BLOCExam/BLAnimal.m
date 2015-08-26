//
// Created by zzdjk6（陈圣晗） on 15/8/9.
// Copyright (c) 2015 zzdjk6（陈圣晗）. All rights reserved.
//

#import "BLAnimal.h"

@implementation BLAnimal
{

}

#pragma mark - Override

- (void)setWeight:(float)weight
{
    float upperBound = [self.class weightUpperBound];
    float lowerBound = [self.class weightLowerBound];
    if (weight > upperBound)
        weight = upperBound;
    else if (weight < lowerBound)
        weight = lowerBound;
    _weight    = weight;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.name=%@", self.name];
    [description appendFormat:@", self.weight=%.2f", self.weight];
    [description appendFormat:@", self.gender=%@", self.gender == BLAnimalGenderMale ? @"Male" : @"Female"];
    [description appendString:@">"];
    return description;
}

#pragma mark - Custom

- (void)vocalize
{
    NSLog(@"Vocalize as an Animal: %@.", self);
}

+ (float)weightUpperBound
{
    return FLT_MAX;
}

+ (float)weightLowerBound
{
    return 0.1f;
}

@end