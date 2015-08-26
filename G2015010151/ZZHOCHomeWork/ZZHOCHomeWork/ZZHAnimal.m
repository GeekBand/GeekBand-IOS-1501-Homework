//
//  ZZHAnimal.m
//  ZZHOCHomeWork
//
//  Created by 张志华 on 15/8/15.
//  Copyright (c) 2015年 张志华. All rights reserved.
//

#import "ZZHAnimal.h"

@implementation ZZHAnimal
- (void)bleat{
    NSLog(@"My Name is %@,i am %@,my weight is %f", _name , _genger == ZZHAnimalMale ? @"Male" : @"Female" , _weight);
}
@end
