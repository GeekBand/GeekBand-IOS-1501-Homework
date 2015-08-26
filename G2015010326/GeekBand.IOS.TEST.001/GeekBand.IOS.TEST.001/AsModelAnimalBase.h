//
//  AsModelAnimalBase.h
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, ASAnimalGender) {
    ASAnimalGenderMale = 0,
    ASAnimalGenderFemale
};

@interface AsModelAnimalBase : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) float weight;
@property (nonatomic, assign) ASAnimalGender gender;
//@property (nonatomic) Point position;

- (void)sounding;

- (NSString*)description;
@end

