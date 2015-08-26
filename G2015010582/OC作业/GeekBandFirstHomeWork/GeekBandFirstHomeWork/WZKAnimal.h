//
//  WZKAnimal.h
//  GeekBandFirstHomeWork
//
//  Created by 王祖康 on 15/8/8.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZKAnimal : NSObject

typedef enum {
    male,
    female
}AnimalSex;

#pragma mark - 属性

//名称
@property(nonatomic,copy)NSString *name;

//性别
@property(nonatomic,assign)AnimalSex sex;

//体重
@property(nonatomic,assign)NSInteger weight;


#pragma mark - 方法

-(id)initWithName:(NSString *)newName withSex:(AnimalSex)newSex withWeight:(NSInteger)newWeight;

-(void)say:(NSString *) message;

@end
