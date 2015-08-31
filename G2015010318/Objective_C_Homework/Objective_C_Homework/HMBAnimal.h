//
//  Animal.h
//  Objective_C_Homework
//
//  Created by 黄穆斌 on 15/8/9.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import <Foundation/Foundation.h>

enum Sex { male, female };

@interface HMBAnimal : NSObject
{
    enum Sex _sex;
    NSString * _name;
    float _weight;
}

@property (nonatomic) enum Sex sex;
@property (nonatomic, strong) NSString * name;
@property (nonatomic) float weight;

- (instancetype) initWithName:(NSString * )name sex:(enum Sex)sex weight:(float)weight;

- (void) sounding;

@end
