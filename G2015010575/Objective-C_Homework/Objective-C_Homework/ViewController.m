//
//  ViewController.m
//  Objective-C_Homework
//
//  Created by 祝海焜 on 15/9/5.
//  Copyright (c) 2015年 祝海焜. All rights reserved.
//

#import "ViewController.h"
#import "BLFish.h"
#import "BLBird.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //建立数组，遍历对象
    NSMutableArray *animalArray=[[NSMutableArray alloc]initWithCapacity:20];
    SEX sex = Male;
    for (int i=0; i<20; i++) {
//        sex = !sex;
        if (i%2==0) {
            BLBird *bird=[[BLBird alloc]initWithName:[NSString stringWithFormat:@"bird%i",i] weight:[[NSNumber numberWithInt:i] integerValue]sex:sex];
            [animalArray addObject:bird];
        
        }else{
            BLFish *fish=[[BLFish alloc]initWithName:[NSString stringWithFormat:@"fish%i",i] weight:[[NSNumber numberWithInt:i] integerValue]sex:sex];
            [animalArray addObject:fish];
        }
    }
    
    for (id object in animalArray) {
        if ([[object class]isSubclassOfClass:[BLFish class]]) {
            [(BLFish *)object swim];
        }else if([[object class]isSubclassOfClass:[BLBird class]]) {
            [(BLBird *)object fly];
        }
    }
    
    //捞鱼
    NSLog(@"池塘中有%lu条鱼",[animalArray count]);
    NSInteger fishCount=  arc4random()%10;
    NSInteger i=0;
    while (i!=fishCount) {
        NSInteger index = arc4random()%[animalArray count];
        if ([[[animalArray objectAtIndex:index] class]isSubclassOfClass:[BLFish class]]) {
            i++;
            [animalArray removeObjectAtIndex:index];
        }
    }
    NSLog(@"随机捞到%lu条鱼",fishCount);
    
    //内存释放暂有问题，还在处理
    
    //打鸟
    NSLog(@"天上有%lu只鸟",[animalArray count]);
    NSInteger birdcount=  arc4random()%10;
    NSInteger o=0;
    while (o!=birdcount) {
        NSInteger index = arc4random()%[animalArray count];
        if ([[[animalArray objectAtIndex:index] class]isSubclassOfClass:[BLBird class]]) {
            o++;
            [animalArray removeObjectAtIndex:index];
        }
    }
    NSLog(@"随机打了%lu只鸟",birdcount);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
