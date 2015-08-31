//
//  LEIAnimals.h
//  IOS homeWork
//
//  Created by 雷源 on 15/8/14.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LEIAnimals : NSObject

// define animals' gender with enum
typedef enum AnimalsGender{
    AnimalGenderMale,           //male
    AnimalGenderFemal,          //female
    AnimalGenderHermaphrodite,  //hermaphrodite
    AnimalGenderUnknown         //unknown
} LEIAnimalsGender;
typedef enum AnimalsColor{
    AnimalColorSilver = 1,
    AnimalColorYellow = 2,
    AnimalColorBlue = 3,
    AnimalColorOrange = 4,
} LEIAnimalsColor; //define animals color

@property (nonatomic , copy) NSString *name;
@property (nonatomic,  assign) CGFloat weight;
@property (nonatomic, assign)LEIAnimalsGender animalsGender;

-(instancetype)initWithName:(NSString *)name Weight:(CGFloat)weight Gender:(LEIAnimalsGender)gender;

-(void)dealloc;

-(void)crying;

-(void)printInfo;

@end
