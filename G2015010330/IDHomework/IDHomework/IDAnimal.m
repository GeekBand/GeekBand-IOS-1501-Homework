//
//  IDAnimal.m
//  IDHomework
//
//  Created by int2d on 15/8/13.
//  Copyright (c) 2015年 int2d. All rights reserved.
//

#import "IDAnimal.h"




@implementation IDAnimal

- (id)initWithName:(NSString *)name sex:(IDSex)sex weight:(float)weight {
    self = [super init];
    
    if (self) {
        _name = name;
        _sex = sex;
        _weight = weight;
    }
    
    return self;
}

- (void)say {
    
    NSLog(@"发声");
    
}

@end
