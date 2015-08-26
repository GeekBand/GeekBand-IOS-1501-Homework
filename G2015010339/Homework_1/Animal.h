//
//  Animal.h
//  Homework_1
//
//  Created by ZhouJiahui on 8/17/15.
//  Copyright (c) 2015 ZhouJiahui. All rights reserved.
//

#ifndef Homework_1_Animal_h
#define Homework_1_Animal_h

#import <Foundation/Foundation.h>
typedef enum {
    male,
    female
}sex;

@interface Animal : NSObject

@property(nonatomic,copy)NSString *name;

@property(nonatomic,assign)sex sex;

@property(nonatomic,assign)NSInteger weight;

-(id)initWithName:(NSString *)Name Sex:(sex)Sex Weight:(NSInteger)weight;

-(void)say:(NSString *) message;

@end

#endif
