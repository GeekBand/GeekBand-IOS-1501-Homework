//
//  BLAnimal.h
//  Objective-C_Homework
//
//  Created by 祝海焜 on 15/9/5.
//  Copyright (c) 2015年 祝海焜. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {Male,Female}SEX;

@interface BLAnimal : NSObject

@property(nonatomic, strong)NSString *name;
@property(nonatomic, assign)SEX animalSex;
@property(nonatomic, assign)NSInteger weight;

-(id)initWithName:(NSString *)name
           weight:(NSInteger)weight
              sex:(SEX)sex;

- (void)animalSay;

@end
