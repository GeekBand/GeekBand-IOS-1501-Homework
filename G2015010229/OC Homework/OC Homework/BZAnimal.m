//
//  BZAnimal.m
//  OC Homework
//
//  Created by 张弢 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "BZAnimal.h"

@interface BZAnimal ()

    @property (nonatomic, assign, readwrite) BZGender gender;

@end

@implementation BZAnimal

-(instancetype)initWithName:(NSString *)name gender:(BZGender)gender weight:(NSInteger) weight
{
    self = [super init];
    if (self) {
        self.name = name;
        self.gender = gender;
        self.weight = weight;
    }
    return self;
}

-(void)speak:(NSString *)content
{
    NSLog(@"animal %@ says: %@", self.name, content);
}

@end
