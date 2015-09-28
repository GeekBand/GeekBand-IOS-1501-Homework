//
//  WZAnimal.h
//  GeekBandHomeWork01
//
//  Created by Warren on 15/8/13.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    male = 1,
    female
} Sex;

@interface WZAnimal : NSObject

@property (nonatomic) Sex sex;

@property (assign, nonatomic) NSString *gender;
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic)NSInteger weight;

- (void)animalSpeak;
- (instancetype)initWithName:(NSString *)aName sexToGender:(Sex)aSex weight:(NSInteger)aWeight;

@end
