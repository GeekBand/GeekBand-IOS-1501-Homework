//
//  GWAnimal.h
//  BLTest1
//
//  Created by Will Ge on 8/8/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GWAnimal : NSObject


typedef NS_ENUM(NSUInteger, Gender){
    Male,
    Female,
};

@property (nonatomic, assign, readonly) Gender gender;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, assign, readwrite) NSUInteger weight;

- (instancetype)initWithName:(NSString *)name gender:(enum Gender)gender weight:(NSUInteger)weight;

- (void)say;


@end
