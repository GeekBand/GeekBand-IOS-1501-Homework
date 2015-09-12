//
//  OCTAnimal.h
//  BLOCT
//
//  Created by Dige Qiao on 8/13/15.
//  Copyright (c) 2015 Dige Qiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCTAnimal : NSObject

#pragma mark 动物基类

typedef enum {
    isMale ,
    isFemale
}GenderOfAnimal;
//用枚举定义基本属性：性别。

@property (nonatomic, copy)          NSString *name;
@property (nonatomic, assign)          float weight;
@property (nonatomic, assign) GenderOfAnimal gender;

-(instancetype)        name:(NSString *)name
                     weight:(float)weight
                     gender:(GenderOfAnimal)gender;



-(void) hasVocality;
//动物基本能力：发声。


@end