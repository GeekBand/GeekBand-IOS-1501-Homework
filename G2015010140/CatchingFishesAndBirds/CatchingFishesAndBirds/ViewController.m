//
//  ViewController.m
//  CatchingFishesAndBirds
//
//  Created by Turtleeeeeeeeee on 15/8/9.
//  Copyright © 2015年 SCNU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *fishArray = [NSMutableArray array];
    NSMutableArray *birdArray = [NSMutableArray array];
    for (int i = 0 ; i < 10; ++i) {
        Fish *fish = [[Fish alloc] init];
        Bird *bird = [[Bird alloc] init];
        fish.name = [NSString stringWithFormat:@"fish%d",i];
        fish.weight = 5+i;
        fish.gender = i % 2;
        fish.color = [UIColor colorWithRed:(CGFloat)(40 * i % 255)/255.0 green:(CGFloat)(40 * i % 255)/255.0 blue:(CGFloat)(40 * i % 255)/255.0 alpha:1];
        bird.name = [NSString stringWithFormat:@"bird%d",i];
        bird.weight = 10+i;
        bird.gender = i % 2;
        bird.color = [UIColor colorWithRed:(CGFloat)(64 * i % 255)/255.0 green:(CGFloat)(64 * i % 255)/255.0 blue:(CGFloat)(64 * i % 255)/255.0 alpha:1];
        [fishArray addObject:fish];
        [birdArray addObject:bird];
    }
    
    for (Fish *fish in fishArray){
        [fish swim];
    }
    
    for (Bird *bird in birdArray){
        [bird fly];
    }
    
    //捞鱼游戏， 5秒后从主线程开始
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger numOfHunting = arc4random() % 11;
        NSLog(@"捞到%ld条鱼", (long)numOfHunting);
        NSInteger index;
        for (int i = 0 ; i < numOfHunting; ++i) {
            index = arc4random() % (10 - i);//每次remove了object后，数组里的对象都会减少，避免出bug
            Fish *fish = fishArray[index];
            //解除被捞到的鱼的所有引用，令其释放
            NSLog(@"%@ get caught, and it's dead.", fish.name);
            fish = nil;
            [fishArray removeObjectAtIndex:index];
        }
    });
    
    //捕鸟游戏， 5秒后从queue线程开始
    dispatch_queue_t queue = dispatch_queue_create("Catching Bird queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), queue, ^{
        NSInteger numOfHunting = arc4random() % 11;
        NSLog(@"捕到%ld只鸟", (long)numOfHunting);
        NSInteger index;
        for (int i = 0 ; i < numOfHunting; ++i) {
            index = arc4random() % (10 - i);//每次remove了object后，数组里的对象都会减少，避免出bug
            Bird *bird = birdArray[index];
            NSLog(@"%@ get caught, and it's dead.", bird.name);
            //解除被捕到的鸟的所有引用，令其释放
            bird = nil;
            [birdArray removeObjectAtIndex:index];
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
