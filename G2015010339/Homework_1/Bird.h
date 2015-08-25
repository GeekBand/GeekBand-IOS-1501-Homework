//
//  Bird.h
//  Homework_1
//
//  Created by ZhouJiahui on 8/24/15.
//  Copyright (c) 2015 ZhouJiahui. All rights reserved.
//

#ifndef Homework_1_Bird_h
#define Homework_1_Bird_h

#import "Animal.h"

@interface Bird : Animal

@property(nonatomic,copy)NSString *color;


-(NSString *) fly;

@end

#endif
