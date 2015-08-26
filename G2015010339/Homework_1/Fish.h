//
//  Fish.h
//  Homework_1
//
//  Created by ZhouJiahui on 8/24/15.
//  Copyright (c) 2015 ZhouJiahui. All rights reserved.
//

#ifndef Homework_1_Fish_h
#define Homework_1_Fish_h

#import "Animal.h"

@interface Fish : Animal

@property(nonatomic,copy)NSString *color;


-(NSString *)swim;

@end

#endif
