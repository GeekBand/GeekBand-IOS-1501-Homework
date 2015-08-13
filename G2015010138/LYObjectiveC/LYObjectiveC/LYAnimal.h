//
//  LYAnimal.h
//  LYObjectiveC
//
//  Created by zero on 15/8/8.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYAnimal : NSObject

//typedef enum {@"male", @"female"} (NSString)animalSex;
typedef NS_ENUM(NSInteger, animalSex){male,female};

@property (nonatomic,assign) NSString *sex;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger weight;

- (instancetype)initWithName:(NSString *)name andWeight:(NSInteger)weight sex:(animalSex)sex;
- (void)makeSound;

@end

