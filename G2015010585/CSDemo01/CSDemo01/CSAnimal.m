//
//  CSAnimal.m
//  CSDemo01
//
//  Created by ZhangBob on 8/8/15.
//  Copyright (c) 2015 ZhangBob. All rights reserved.
//

#import "CSAnimal.h"

@implementation CSAnimal





//+ (CSAnimal *)creatAnimal
//{
//    CSAnimal *animal = [[CSAnimal alloc]initWithName:@"Fish" weight:10 sexuality:@"male"];
//    return [animal];
//    
//}

-(instancetype)initWithName:(NSString *)name weight:(NSInteger)weight gender:(animalGender)gender
{
    self = [super init];
    if (self) {
        self.name = name;
        self.weight = weight;
        self.gender = gender;
    }
    return self;
}

-(void)animalVoice
{
    NSLog(@"animal's Voice");
}



@end
