//
//  AsModelAnimalBase.m
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "AsModelAnimalBase.h"

@implementation AsModelAnimalBase

@synthesize weight = _weight;

- (NSString*)name
{
    if (!_name) {
        _name = [[NSString alloc] init];
    }
    return _name;
}

- (float)weight
{
    if (!_weight) {
        _weight = 0.1;
    }
    return _weight;
}

- (void)setWeight:(float)weight
{
    if (weight <= 0) {
        weight = 0.1;
    }
    _weight = weight;
}

- (ASAnimalGender)gender
{
    if (!_gender) {
        _gender = ASAnimalGenderMale;
    }
    return _gender;
}

- (void)sounding
{
    NSLog(@"Animal [%@]: Sounding!", self.name);
}

- (NSString*)description
{
    NSMutableString * description = [[NSMutableString alloc] init];
    [description appendFormat:@"%@", NSStringFromClass([self class])];
    [description appendFormat:@"%@", self.name];
    [description appendFormat:@"%@", self.gender == ASAnimalGenderMale? @"Male": @"Female"];
    [description appendFormat:@"%.2f", self.weight];
    return description;
}
@end
