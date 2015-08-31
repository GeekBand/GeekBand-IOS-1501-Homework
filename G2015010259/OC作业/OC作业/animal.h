//
//  animal.h
//  OC作业
//
//  Created by Ryan on 15/8/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>

// 性别
typedef enum {
    animalMale,
    animalFemale,
} animalSex;

@interface animal : NSObject

// 基本属性
@property (nonatomic , strong)  NSString * name;
@property (nonatomic , assign)  CGFloat weight;
@property (nonatomic , assign)  animalSex sex;
- (id) initWithName:(NSString *)name andSex:(animalSex)sex andWeight:(CGFloat)weight;

// 基本能力
- (void) animalSay;


@end
