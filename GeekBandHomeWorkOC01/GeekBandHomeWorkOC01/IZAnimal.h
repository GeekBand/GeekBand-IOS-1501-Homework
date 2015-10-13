//
//  IZAnimal.h
//  GeekBandHomeWorkOC01
//
//  Created by Liang Zisheng on 9/5/15.
//  Copyright (c) 2015 ALMOND. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    male,
    female,
    other,
} Gender;

@interface IZAnimal : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) Gender gender;
@property (nonatomic) NSUInteger weight;

- (instancetype)initWithName:(NSString *)name Gender:(Gender)gender Weight:(NSUInteger)weight;

- (instancetype)initWithInfoDictionary:(NSDictionary *)infoDictionary;

- (void)phonate;

@end
