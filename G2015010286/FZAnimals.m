//
//  FZAnimals.m
//  Hunt
//
//  Created by Flame on 15/8/8.
//  Copyright © 2015年 Flame. All rights reserved.
//

#import "FZAnimals.h"

@implementation FZAnimals

+ (instancetype)initWithName:(NSString *)name andWeight:(float)weight andSex:(Sex)sex{
    FZAnimals *newAnimal = [[FZAnimals alloc] init];
    newAnimal.name = name;
    newAnimal.weight = weight;
    newAnimal.sex = sex;
    return newAnimal;
}

- (void)animalSound{
    NSLog(@"animal make sound");
}

@end
