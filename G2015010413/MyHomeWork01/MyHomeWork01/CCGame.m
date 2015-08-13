//
//  Game.m
//  HomeWork01
//
//  Created by 张亚群 on 15/8/13.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import "CCGame.h"

@implementation CCGame

-(NSMutableArray *)play{
    //随即产生一个数（<self.animal），代表捞到几条鱼或打了几个鸟；
    
    NSMutableArray *getAnimal = [[NSMutableArray alloc]init];
    
     NSInteger sum = arc4random() % [self.animals count];;//捞（打）到几只
    
    for (int i = 0; i < sum; i++) {
        
        NSInteger random = arc4random() % ([self.animals count] -1);//随机找出sum个动物
        
        [getAnimal addObject:self.animals[random]];
        
        [self.animals removeObjectAtIndex:random];
        
    }
    
    return  getAnimal;//返回捞到的鱼（鸟）
}

@end
