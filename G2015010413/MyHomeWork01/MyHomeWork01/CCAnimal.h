//
//  CCAnimal.h
//  HomeWork01
//
//  Created by 张亚群 on 15/8/12.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum color{Red,Yellow,Green,Blue,White,Black,Brown,Pink,Ink,Golden,Orange}Color;
typedef enum sex{男,女,雌,雄} Sex;


@interface CCAnimal : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSNumber *weight;
@property(nonatomic,assign)Sex sex;


- (void)makeSound;

@end
