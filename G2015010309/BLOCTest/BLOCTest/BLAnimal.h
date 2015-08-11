//
//  BLAnimal.h
//  BLOCTest
//
//  Created by HeJay on 8/10/15.
//  Copyright (c) 2015 Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLAnimal : NSObject

typedef enum {
    BLMale = 0,
    BLFemal = 1
}BLGender;

@property(nonatomic, assign)BLGender gender;
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)float weight;

- (void)speak : (NSString *)sound;

@end
