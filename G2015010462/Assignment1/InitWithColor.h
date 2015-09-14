//
//  InitWithColor.h
//  Assignment1
//
//  Created by 杨立 on 15/8/10.
//  Copyright (c) 2015年 杨立. All rights reserved.
//

#import "Animal.h"

@interface InitWithColor : Animal{
    NSString *_color;
}

@property(nonatomic, strong) NSString *color;
-(instancetype)initWithColor: (NSString *)color WithName: (NSString *)name WithGender: (Gender)gender WithWeight: (NSUInteger)weight;

@end
