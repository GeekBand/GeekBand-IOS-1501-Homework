//
//  ViewController.m
//  GBAnimal
//
//  Created by SeaHub on 15/8/9.
//  Copyright (c) 2015年 Geekband. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "Fish.h"
#import "Bird.h"

@interface ViewController ()
@end
NSMutableArray *aliveAnimal;

@implementation ViewController

#pragma mark - Run
- (void)viewDidLoad {
    [super viewDidLoad];
    aliveAnimal = [NSMutableArray array];
    [Animal createAnimal:aliveAnimal];
    /*将10鸟10鱼加至数组*/
    for (Animal *animal in aliveAnimal) {
        [animal say];
        /*实现：switch判断性别，男女不同输出*/
        [animal animalDo:animal];
        /*实现：isSubclassOf判断所属子类，分别调用swim与fly*/
        NSLog(@"\n");
    }
    [Animal catchAnimal:aliveAnimal];
    /*实现：arc4random置随机数，判断是否越界，判断是否分别属于bird/fish，通过removeObjectAtIndex删除*/
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
