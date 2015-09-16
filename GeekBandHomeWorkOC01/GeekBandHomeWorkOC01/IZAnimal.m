//
//  IZAnimal.m
//  GeekBandHomeWorkOC01
//
//  Created by Liang Zisheng on 9/5/15.
//  Copyright (c) 2015 ALMOND. All rights reserved.
//

#import "IZAnimal.h"

@implementation IZAnimal

- (instancetype)initWithName:(NSString *)name Gender:(Gender)gender Weight:(NSUInteger)weight {
    if (self = [super init]) {
        _name = name;
        _gender = gender;
        _weight = weight;
    }
    return self;
}

- (instancetype)initWithInfoDictionary:(NSDictionary *)infoDictionary {
    if (self = [super init]) {
        _name = [infoDictionary valueForKey:@"Name"];
        _gender = [[infoDictionary valueForKey:@"Gender"] intValue];
        _weight = [[infoDictionary valueForKey:@"Weight"] unsignedIntValue];
    }
    return self;
}

- (void)phonate {
    NSLog(@"xx");
}
@end
