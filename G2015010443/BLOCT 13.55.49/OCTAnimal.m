//
//  OCTAnimal.m
//  BLOCT
//
//  Created by Dige Qiao on 8/13/15.
//  Copyright (c) 2015 Dige Qiao. All rights reserved.
//

#import "OCTAnimal.h"

@implementation OCTAnimal

-(instancetype) name:(NSString *)name
              weight:(float)weight
              gender:(GenderOfAnimal)gender

{
    self.name=name;
    self.weight=weight;
    self.gender=gender;
    return self;
    
}

-(void) hasVocality
{
    NSLog(@"I am a %@", self);
}


@end
