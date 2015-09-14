//
//  GWAnimal.h
//  BLTest1
//
//  Created by Will Ge on 8/8/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/// 🐦🐟 An animal can say, maybe a bird or a fish.
@interface GWAnimal : NSObject

/**
    Animal's Gender.
 
    - Male: for male.
 
    - Female: for female.
 */
typedef NS_ENUM(NSUInteger, Gender){
    Male,
    Female,
};

/// The gender of the animal.
@property (nonatomic, assign, readonly) Gender gender;

/// The name of the animal.
@property (nonatomic, copy, readonly) NSString *name;

/// The weight of the animal.
@property (nonatomic, assign, readwrite) NSUInteger weight;


// :param: and :returns: format is not support Objective-C, but Swift.

/**
 
    Initializes a new animal with the provided parts and specifications.
 
    :param: name The name of the animal
 
    :param: gender The gender of the animal
 
    :param: weight The weight of the animal
 
    :returns: A new animal who has name, gender and weight.
*/
- (instancetype)initWithName:(NSString *)name gender:(Gender)gender weight:(NSUInteger)weight;

/**
   animal can say.
 */
- (void)say;


@end
