//
//  HJYMainViewController.m
//  Objective-C高级编程测试题
//
//  Created by 黄纪银163 on 15/8/9.
//  Copyright (c) 2015年 Jiyin Huang. All rights reserved.
//  主控制器

#import "HJYMainViewController.h"
#import "HJYBird.h"
#import "HJYFish.h"
#import "HJYAnimal.h"

@interface HJYMainViewController ()
/** 装鱼和鸟的数组 */
@property (nonatomic, strong) NSMutableArray *animals;

@end

@implementation HJYMainViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1 创建10条鱼 10只鸟 放进数组
    self.animals = [NSMutableArray array];
    
    for (NSInteger i = 1; i<=10; i++)
    {
        HJYBird *bird = [[HJYBird alloc] init];
        HJYFish *fish = [[HJYFish alloc] init];
        
        bird.name = [NSString stringWithFormat:@"bird--%li", i];
        fish.name = [NSString stringWithFormat:@"fish--%li", i];
        
        [self.animals addObject:bird];
        [self.animals addObject:fish];
    }
    
    // 2 遍历数组 让鱼游 让鸟飞
    for (NSInteger i = 0; i<self.animals.count; i++)
    {
        HJYAnimal *animal = [self.animals objectAtIndex:i];
        
        if ([animal isKindOfClass:[HJYBird class]])
        {
            HJYBird *bird = (HJYBird *)animal;
            [bird fly];
        }
        else if ([animal isKindOfClass:[HJYFish class]])
        {
            HJYFish *bird = (HJYFish *)animal;
            [bird swim];
        }
    }
    
    NSLog(@"第三题完成分割线----------------------------");
    
    // 3 捞鱼
    // 3.1 一共10条鱼,猜每条鱼的位置,然后算打捞一次
    NSArray *fishIndexs = [self guessIndexsWithCount:10 uniform:20]; // 记录猜测的鱼位置
    NSMutableArray *freeAnimals = [NSMutableArray array];// 记录要释放的动物
    __block NSInteger catchFishCount = 0;                // 记录捉到的鱼数量
    
    // 3.2 遍历数组 , 看猜对了几条鱼
    [fishIndexs enumerateObjectsUsingBlock:^(NSNumber *index, NSUInteger idx, BOOL *stop)
    {
        HJYAnimal *animal = self.animals[[index integerValue]];
        
        if ([animal isKindOfClass:[HJYFish class]])
        {
            // 记录捞到的鱼数量
            catchFishCount++;
            // 添加捞到的鱼到释放数组
            [freeAnimals addObject:animal];
        }
    }];
    
    NSLog(@"共捉到 : %ld 条鱼.",catchFishCount);
    
    
    // 4 打鸟
    // 4.1
    NSArray *birdIndexs = [self guessIndexsWithCount:10 uniform:20]; // 记录猜测的鸟的位置
    __block NSInteger catchbirdCount = 0;                // 记录打到的鸟数量
    
    // 4.2 遍历数组 , 看猜对了几条鱼
    [birdIndexs enumerateObjectsUsingBlock:^(NSNumber *index, NSUInteger idx, BOOL *stop)
     {
         HJYAnimal *animal = self.animals[[index integerValue]];
         
         if ([animal isKindOfClass:[HJYBird class]])
         {
             // 记录捞到的鱼数量
             catchbirdCount++;
             // 添加捞到的鱼到释放数组
             [freeAnimals addObject:animal];
         }
     }];
    
    NSLog(@"共打到 : %ld 只鸟.",catchbirdCount);
    
    // 统一释放捉到打到的animal
    [freeAnimals enumerateObjectsUsingBlock:^(HJYAnimal *animal, NSUInteger idx, BOOL *stop)
    {
        [self.animals removeObject:animal];
    }];
    [freeAnimals removeAllObjects];
    
    NSLog(@"第四题完成分割线----------------------------");
    
}

#pragma mark - priteve methods
#pragma mark 猜测的位置数组
- (NSArray *) guessIndexsWithCount:(NSInteger)count uniform:(int)uniform
{
    NSInteger i = count;
    NSMutableArray *indexs = [NSMutableArray array];
    
    // 添第个随机数
    NSInteger firstRandomIndex = arc4random_uniform(uniform);
    [indexs addObject:@(firstRandomIndex)];
    i--;
    
    // 添后续的随机数
    while (i > 0)
    {
        NSInteger randomIndex = arc4random_uniform(uniform);
        
        BOOL isEqual = NO; // 判断是否相同的随机数
        
        for (NSInteger j = 0; j<indexs.count; j++)
        {
            NSInteger index = [indexs[j] integerValue];
            
            // 记录相同的状态
            if (index == randomIndex)
            {
                isEqual = YES;
                break;
            }
        }
        // 不相同添加到猜想数组中
        if (!isEqual)
        {
            [indexs addObject:@(randomIndex)];
            i--;
        }
    }
    
    return [indexs copy];
}

@end
