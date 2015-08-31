//
//  main.m
//  HomeWork01
//
//  Created by 张亚群 on 15/8/12.
//  Copyright (c) 2015年 张志超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CCAnimal.h"
#import "CCBird.h"
#import "CCFish.h"
#import "CCGame.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        CCBird *bird = [[CCBird alloc]init];
        
        bird.color = Black;
        
        [bird fly];
        
        CCFish *fish = [[CCFish alloc]init];
        
        fish.color = Red;
        
        [fish swim];
        
        
        NSMutableArray *animals = [[NSMutableArray alloc]initWithCapacity:25];
        
        for (int i = 0; i < 10 ; i++) {
            
            bird = [[CCBird alloc] initWithColor:i];//赋值不同颜色±
            
            fish = [[CCFish alloc] initWithColor:i];
            
            [animals addObject:bird];
            
            [animals addObject:fish];
        }
        
        //遍历
        
        for (CCAnimal *animal in animals) {
            
            if ([animal isKindOfClass:[CCBird class] ]) {
                
                [animal performSelector:@selector(fly)];
                
            }else{
                
                [animal performSelector:@selector(swim)];
            }
            
        }
        
        //模拟捞鱼
        
        CCGame *game = [[CCGame alloc] init];
        
        game.animals = animals;
        
        NSMutableArray *muArray = [game play];
        
        NSLog(@"你一共捞取了%li 个动物",[muArray count]);
        
        NSLog(@"%@",muArray);
        
        NSLog(@"还有%li个动物",[animals count]);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
