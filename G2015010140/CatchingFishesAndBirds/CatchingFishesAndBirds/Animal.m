//
//  Animal.m
//  CatchingFishesAndBirds
//
//  Created by Turtleeeeeeeeee on 15/8/9.
//  Copyright © 2015年 SCNU. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(void)sayMyInfo{
    if (_gender == Male) {
        NSLog(@"My name is %@, I'm male, %fkg", _name, _weight);
    }
    else{
        NSLog(@"My name is %@, I'm female, %fkg", _name, _weight);
    }
}

@end
