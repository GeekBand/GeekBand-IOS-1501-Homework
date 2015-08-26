//
// Created by zzdjk6（陈圣晗） on 15/8/9.
// Copyright (c) 2015 zzdjk6（陈圣晗）. All rights reserved.
//

typedef NS_ENUM(NSUInteger, BLAnimalGender)
{
    BLAnimalGenderMale,
    BLAnimalGenderFemale,
};

@interface BLAnimal : NSObject

@property(nonatomic, copy) NSString         *name;
@property(nonatomic, assign) float          weight;
@property(nonatomic, assign) BLAnimalGender gender;

- (void)vocalize;

- (NSString *)description;

+ (float)weightUpperBound;

+ (float)weightLowerBound;

@end