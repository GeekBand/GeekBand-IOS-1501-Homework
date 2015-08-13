//
//  LDAnimal.h
//  GeekBand-IOS-1501-Homework
//
//  Created by ld on 15/8/11.
//  Copyright (c) 2015年 lvdong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {male,female} Sex;

@interface LDAnimal : NSObject
{
}

@property(nonatomic)Sex sex;
@property(nonatomic,weak)NSString *name;
@property(nonatomic,weak)NSNumber *weight;

- (void)Sound:(NSString *)words;

@end
