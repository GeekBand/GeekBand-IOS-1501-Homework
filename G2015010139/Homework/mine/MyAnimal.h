//
//  MyAnimal.h
//  test2
//
//  Created by john on 15/8/9.
//  Copyright (c) 2015年 john. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {Male, Female, Others} Sex;

@interface MyAnimal : NSObject


@property(nonatomic, copy)NSString * name;
@property(nonatomic, assign)Sex sex;
@property(nonatomic, assign)float weight;

- (instancetype)init;

- (void)speak;

- (void)fly;

-(void)swim;

@end
