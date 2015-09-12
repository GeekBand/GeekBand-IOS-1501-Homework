//
//  main.m
//  IOS homeWork
//
//  Created by 雷源 on 15/8/14.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LEIAnimals.h"
#import "LEIFishes.h"
#import "LEIBirds.h"
#import "AppDelegate.h"

int main(int argc, char * argv[])
{

    NSLog(@"开始生成鸟和鱼的数组\n");
    NSUInteger const AnimalsNum = 20;
    NSMutableArray *animals = [[NSMutableArray alloc] initWithCapacity:AnimalsNum ];
    //创建一个数组。使用一个循环,生成 10 只鸟、10 条鱼的对象,并将 10 只鸟、10 条鱼的对象加入到创建好的数组中
    for (int i = 0; i < 20 ; i++) {
        
        int tColorNum = (arc4random() % 4) + 1;//生成随机颜色，颜色在LEIAnimails中用枚举定义
        LEIAnimalsColor tColor = tColorNum;
        
        int tGenderNum = (arc4random() % 4) + 1;//生成随机性别，性别在LEIAnimails中用枚举定义
        LEIAnimalsGender tGender = tGenderNum;
        
        CGFloat tWeight = (arc4random() % 5000) + 1;//生成随机重量
        
        //前10个加入鱼，后10个加入鸟
        if (i < 10) {
            NSMutableString *fishName = [[NSMutableString alloc] initWithString:@"fish-"];
            [fishName appendString:[NSString stringWithFormat:@"%i",i]];//按编号生成姓名
            LEIFishes *fish = [[LEIFishes alloc] initWithName:fishName Weight:tWeight Gender:tGender];
            fish.color = tColor; //初始化鱼
            // [fish printInfo];
            [animals addObject:fish];
            
        } else {
            NSMutableString *birdName = [[NSMutableString alloc] initWithString:@"bird-"];
            [birdName appendString:[NSString stringWithFormat:@"%i",i]];//按编号生成姓名
            LEIBirds *bird = [[LEIBirds alloc] initWithName:birdName Weight:tWeight Gender:tGender];
            bird.color = tColor;//初始化鸟
            //[bird printInfo];
            [animals addObject:bird];
            
        }
    }
    NSLog(@"生成鸟和鱼的数组结束\n");
    NSLog(@"开始遍历鸟和鱼，鸟输出飞，鱼输出游\n");
    
    for (id animal in animals) {
        if ([[animal class] isSubclassOfClass:[LEIBirds class]]) {
            LEIBirds *tBird = (LEIBirds *)animal;
            [tBird flying];
        } else
        if ([[animal class] isSubclassOfClass:[LEIFishes class]]) {
            LEIFishes *tFish = (LEIFishes *)animal;
            [tFish swimming];
        }
    }
    NSLog(@"结束遍历鸟和鱼\n");
    
    //开始捕鱼和鸟，我的想法是生成一个10以内的随机数n，作为要捕获的每种动物数量；利用n次循环每次抓住一个随机的动物，同时减小数组的数量
    //如果输出XXX has been captured证明调用了dealloc方法。
    NSLog(@"开始捕鱼－－－－－－－－－－\n");
    NSInteger capturedBirdNum = arc4random() % 10;//随机生成被捕鸟和鱼的数量
    NSInteger capturedFishNum = arc4random() % 10;
    NSLog(@"被捕鱼的数量是：%li\n 分别是：",capturedFishNum);
    
    for (int i = 0; i < capturedFishNum; i++) {
        NSInteger capturedFishIndex = arc4random() % (10 - i); //每次循环随机产生一个被抓到index
        [animals removeObjectAtIndex: capturedFishIndex];
    }
    
    NSLog(@"结束捕鱼－－－－－－－－－－\n");

    NSLog(@"开始捕鸟－－－－－－－－－－\n");

    NSLog(@"被捕鸟的数量是：%li\n 分别是：",capturedBirdNum);
    
    for (int i = 0; i < capturedBirdNum; i++) {
        NSInteger capturedBirdIndex = (arc4random() % (10 - i)) + 10 - capturedFishNum; //去除之间捕鱼到数量
        [animals removeObjectAtIndex: capturedBirdIndex];
    }
    
    NSLog(@"结束捕鸟－－－－－－－－－－\n");
    
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}