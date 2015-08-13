//
//  WZAnimal.h
//  GeekBandHomeWork01
//
//  Created by Warren on 15/8/13.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    male,
    female
} Sex;

@interface WZAnimal : NSObject

@property (assign, nonatomic) Sex sex;
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic)NSInteger weight;

- (void)animalSpeak;
- (instancetype)initWithName:(NSString *)aName Sex:(Sex)aSex weight:(NSInteger)aWeight;

@end
