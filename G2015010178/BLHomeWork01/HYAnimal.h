//
//  HYAnimal.h
//  BLHomeWork01
//
//  Created by Hony on 15/8/12.
//  Copyright (c) 2015年 Hony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum {
    animalMale,
    animalFemale
    }Gender;

@interface HYAnimal : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) CGFloat weight;

- (void)sayMyVoice;

@end
