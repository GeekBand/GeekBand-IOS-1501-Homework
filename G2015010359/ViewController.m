//
//  ViewController.m
//  Test01
//
//  Created by leeguoyu on 15/8/9.
//  Copyright (c) 2015年 Guoyu. All rights reserved.
//

#import "ViewController.h"
#import "Bird.h"
#import "Fish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *animalArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<10; i++) {
        //鱼
        Fish *fish = [[Fish alloc] init];
        fish.name = [NSString stringWithFormat:@"小鱼%d号", i];
        fish.gender = arc4random() % 2;
        fish.weight = arc4random() % 30;
        
        [animalArray addObject:fish];
        
        //鸟
        Bird *bird = [[Bird alloc] init];
        bird.name = [NSString stringWithFormat:@"大鸟%d号", i];
        bird.gender = arc4random() % 2;
        bird.weight = arc4random() % 10;
        
        [animalArray addObject:bird];
    }

    //第三题
    for (int i = 0; i < [animalArray count]; i++) {
        if ([animalArray[i] isKindOfClass:[Bird class]]) {
            [animalArray[i] speak];
            [animalArray[i] fly];
        } else if ([animalArray[i] isKindOfClass:[Fish class]]) {
            [animalArray[i] speak];
            [animalArray[i] swim];
        }
    }
    
    //第四题
    NSInteger birdCount = 0;
    NSInteger fishCount = 0;
    for (int i = 0; i < arc4random() % 20; i++) {
        if ([animalArray[i] isKindOfClass:[Bird class]]) {
            birdCount ++;
        }else{
            if ([animalArray[i] isKindOfClass:[Fish class]]) {
                fishCount ++;
            }
        }
    }
    
    NSLog(@"\n\n");
    NSLog(@"捉到了%ld只鸟，捞到了%ld条鱼", (long)birdCount, (long)fishCount);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
