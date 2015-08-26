//
//  main.m
//  GeekBandFirstHomeWork
//
//  Created by 王祖康 on 15/8/8.
//  Copyright (c) 2015年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZKAnimal.h"
#import "WZKBird.h"
#import "WZKFish.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#pragma mark - 作业2
        
        //初始化数组
        NSMutableArray *array=[[NSMutableArray alloc] init];
        
        //生成10个鸟对象和10个鱼对象，并添加到数组中
        for (NSInteger i=0; i<10; i++) {
            
            WZKBird *bird=[[WZKBird alloc] initWithName:[NSString stringWithFormat:@"bird%li",(long)i] withSex:male withWeight:10];
            bird.color=@"blue";
            
            WZKFish *fish=[[WZKFish alloc] initWithName:[NSString stringWithFormat:@"fish%li",(long)i] withSex:female withWeight:1];
            fish.color=@"red";
            
            [array addObject:bird];
            [array addObject:fish];
        }
        
#pragma mark - 作业3
        
        //循环遍历array数组
        for (NSInteger i=0; i<[array count]; i++) {
            
            id arrayItem=array[i];
            
            if ([arrayItem isKindOfClass:[WZKBird class]]) {
                
                WZKBird *bird=arrayItem;
                
                NSString *birdSex;
                if (bird.sex==male) {
                    birdSex=@"男";
                }
                else if(bird.sex==female)
                {
                    birdSex=@"女";
                }
                
                NSLog(@"名字：%@；颜色：%@；性别：%@；重量：%li 的鸟%@",
                      bird.name,
                      bird.color,
                      birdSex,
                      bird.weight,
                      [bird fly]);
            }
            
            if ([arrayItem isKindOfClass:[WZKFish class]]) {
                
                WZKFish *fish=arrayItem;
                
                NSString *fishSex;
                if (fish.sex==male) {
                    fishSex=@"男";
                }
                else if(fish.sex==female)
                {
                    fishSex=@"女";
                }
                
                NSLog(@"名字：%@；颜色：%@；性别：%@；重量：%li 的鱼%@",
                      fish.name,
                      fish.color,
                      fishSex,
                      fish.weight,
                      [fish swim]);
            }
        }
        
#pragma mark - 作业4
        
        int catchTotalNum = (arc4random() % 20) + 1;
        
        int catchedFishNum=0;
        int catchedBirdNum=0;
        
        for (NSInteger i=catchTotalNum; i>0; i--) {
            
            NSInteger randomIndex=(NSInteger)(arc4random() % i);
            
            id arrayItem=array[randomIndex];
            
            if ([arrayItem isKindOfClass:[WZKFish class]]) {
                catchedFishNum++;
            }
            
            if ([arrayItem isKindOfClass:[WZKBird class]]) {
                catchedBirdNum++;
            }
            
            [array removeObjectAtIndex:randomIndex];
            
            [arrayItem release];
            
            arrayItem=nil;
        }
        
        NSLog(@"捕来%i条鱼；打了%i只鸟",catchedFishNum,catchedBirdNum);
    }
    return 0;
}
