//
//  main.m
//  OC作业
//
//  Created by Ryan on 15/8/9.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fish.h"
#import "bird.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int arrCount    = 10;
        NSMutableArray  *fishArray = [NSMutableArray array];
        NSMutableArray  *birdArray = [NSMutableArray array];
        for (int i = 1 ; i <= arrCount ; i++){
            
            fish *myFish     = [[fish alloc] initWithName: [NSString stringWithFormat:@"Fish_%d" , i] andSex:animalFemale andWeight:5 andColor:@"yellow"];
            [fishArray addObject:myFish];
            
            bird *myBird     = [[bird alloc] initWithName: [NSString stringWithFormat:@"Bird_%d" , i] andSex:animalFemale andWeight:7 andColor:@"red"];
            [birdArray addObject:myBird];
        }
        
        // 第三题
        
        // 遍历鱼儿游方法
        for (int j = 0 ; j < arrCount ; j ++){
            [fishArray[j] fishSwimming];
        }
        
        // 遍历调用鸟儿飞方法
        for (bird *perBird in birdArray){
            [perBird birdFly];
        }
        
        // 第四题
        
        // 初始抓到的0条鱼
        int getFishCount    = 0;
        
        for (int k = 0 ; k < arrCount ; k++){
            
            // 创建0 - 9的随机数
            NSInteger randomNum=(NSInteger)(arc4random() % (arrCount - getFishCount));
            // 如果随机数和当前遍历键相等，那么鱼被打中
            if (k == randomNum){
                // 被抓到的鱼的数量加1
                getFishCount++;
                // 将该鱼移除
                [fishArray removeObjectAtIndex:k];
            }
        }
        NSLog(@"%d条鱼被抓了." , getFishCount);

    }
    return 0;
}
