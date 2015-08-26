//
//  MyBird.h
//  test2
//
//  Created by john on 15/8/9.
//  Copyright (c) 2015年 john. All rights reserved.
//

#import "MyAnimal.h"

@interface MyBird : MyAnimal

@property(nonatomic, copy)NSString * color;

- (instancetype)initWithName:(NSString *)name;

- (void)fly;

@end
