//
//  Animal.m
//  GBAnimal
//
//  Created by SeaHub on 15/8/9.
//  Copyright (c) 2015年 Geekband. All rights reserved.
//

#import "Animal.h"
#import "Fish.h"
#import "Bird.h"


@implementation Animal

+(void)createAnimal:(NSMutableArray *)aliveArray{
    [Fish createFish:aliveArray];
    [Bird createBird:aliveArray];
}

-(void)say{
    switch (self.sex) {
        case male:
            NSLog(@"Animal Say:My name is %@,weight is %.1f,I am Male.And now I am swimming",self.name,self.weight);
            break;
        case female:
            NSLog(@"Animal Say:My name is %@,weight is %.1f,I am Female. And now I am swimming",self.name,self.weight);
        default:
            break;
    }

}

-(instancetype)initWithName:(NSString *)aName
                     Sexual:(sexual)aSex
                     Weight:(CGFloat)aWeight{
    self=[super init];
    if (self) {
        _name= aName;
        _sex= aSex;
        _weight= aWeight;
    }
    return  self;
}

-(void)animalDo:(id)aAnimal{
    if([aAnimal isMemberOfClass:[Fish class]]){
        aAnimal = (Fish *)aAnimal;
        [aAnimal fishSwim];
    }else if ([aAnimal isMemberOfClass:[Bird class]]){
        aAnimal = (Bird *)aAnimal;
        [aAnimal birdFly];
    }
}

+(void)catchAnimal:(NSMutableArray *)catchArray{
    [Fish fishArrested:catchArray];
    NSLog(@"\n");
    [Bird birdArrested:catchArray];
    NSLog(@"\n");
}


@end
