//
//  ViewController.m
//  Objective_C_Homework
//
//  Created by 黄穆斌 on 15/8/9.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import "HMBViewController.h"
#import "HMBBird.h"
#import "HMBFish.h"
#import "HMBGameObjectView.h"
#define ARC4RANDOM_MAX 0x100000000 /**< 随机数的最大值 */

@interface HMBViewController ()
@property (nonatomic, strong) NSMutableArray      * gameObjects;         /**< 储存所有动物类 */
@property (nonatomic, strong) UIButton            * scoreboard;          /**< 中间的重置按钮 */
@property (nonatomic, strong) NSMutableDictionary * gameImageDictionary; /**< 储存动物类跟视图的对应字典 */
@end

@implementation HMBViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurationButtonAndLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self creatGameObject];
    [self traverseGameObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 作业3 生成鸟跟鱼各10个对象并遍历他们
// 在原有作业要求的基础上，增加了调用视图更新的操作。

// 创造鸟跟鱼的对象，并且给他附上序号名字以及随机颜色。
// 然后将它们储存到gameObjects
- (void)creatGameObject {
    if (!self.gameObjects) {
        self.gameObjects = [[NSMutableArray alloc] init];
    }
    for (int i = 0; i < 10; i++) {
        HMBBird * bird = [[HMBBird alloc] init];
        bird.name      = [NSString stringWithFormat:@"bird%i", i];
        bird.color     = [[UIColor alloc] initWithRed:arc4random() % 255 / 255.0 green: arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1]; // 随机生成颜色
        [self.gameObjects addObject:bird];
        HMBFish * fish = [[HMBFish alloc] init];
        fish.name      = [NSString stringWithFormat:@"fish%i", i];
        fish.color     = [[UIColor alloc] initWithRed:arc4random() % 255 / 255.0 green: arc4random() % 255 / 255.0 blue:arc4random() % 255 / 255.0 alpha:1];
        [self.gameObjects addObject:fish];
    }
    [self updateView];
}

// 遍历所有对象
- (void)traverseGameObject {
    for (id gameObject in self.gameObjects) {
        if ([gameObject isMemberOfClass:[HMBBird class]]) {
            [gameObject flying];
        } else if ([gameObject isMemberOfClass:[HMBFish class]]) {
            [gameObject swimming];
        }
    }
}

#pragma mark - 作业4 捞鱼跟打鸟
// 在原有作业要求的基础上，增加了调用删除视图的操作。

// 捕捉鸟跟鱼的方法
// 生成随机捕获数量。
// 遍历对象数组，如果是对应的对象就调用删除视图的动画，然后删除它在字典以及数组中的引用，释放内存。
- (void)catchingBird {
    int randomNumber = arc4random() % 10;
    int time = 0;
    for (int i = 0; i < randomNumber; i++) {
        for (id gameObject in self.gameObjects) {
            if ([gameObject isMemberOfClass:[HMBBird class]]) {
                [self deleteViewAnimation:[self.gameImageDictionary objectForKey:[gameObject name]]];
                [self.gameImageDictionary removeObjectForKey:[gameObject name]];
                [self.gameObjects removeObject:gameObject];
                time += 1;
                break;
            }
        }
    }
    [self.scoreboard setTitle:[NSString stringWithFormat:@"Catch %i Bird", time] forState:UIControlStateNormal];
}

- (void)catchingFish {
    int randomNumber = arc4random() % 10;
    int time = 0;
    for (int i = 0; i < randomNumber; i++) {
        for (id gameObject in self.gameObjects) {
            if ([gameObject isMemberOfClass:[HMBFish class]]) {
                [self deleteViewAnimation:[self.gameImageDictionary objectForKey:[gameObject name]]];
                [self.gameImageDictionary removeObjectForKey:[gameObject name]];
                [self.gameObjects removeObject:gameObject];
                time += 1;
                break;
            }
        }
    }
    [self.scoreboard setTitle:[NSString stringWithFormat:@"Catch %i Fish", time] forState:UIControlStateNormal];
}

#pragma mark - 配置游戏UI

// 配置中间三个按钮，并将他们跟捕获鸟跟鱼还有重置的方法连接起来。
- (void)configurationButtonAndLabel {
    CGSize viewSize = self.view.frame.size;
    
    UIButton * catchBirdButton = [UIButton buttonWithType:UIButtonTypeSystem];
    catchBirdButton.frame = CGRectMake(0, viewSize.height / 2 - 20, 100, 40);
    [catchBirdButton setTitle:@"Catch Bird" forState:UIControlStateNormal];
    [catchBirdButton addTarget:self action:@selector(catchingBird) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:catchBirdButton];
    
    UIButton * catchFishButton = [UIButton buttonWithType:UIButtonTypeSystem];
    catchFishButton.frame = CGRectMake(viewSize.width - 100, viewSize.height / 2 - 20, 100, 40);
    [catchFishButton setTitle:@"Catch Fish" forState:UIControlStateNormal];
    [catchFishButton addTarget:self action:@selector(catchingFish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:catchFishButton];
    
    self.scoreboard = [UIButton buttonWithType:UIButtonTypeSystem];
    self.scoreboard.frame  = CGRectMake(100, viewSize.height / 2 - 20, viewSize.width- 200, 40);
    [self.scoreboard setTitle:@"No start yet!" forState:UIControlStateNormal];
    [self.scoreboard addTarget:self action:@selector(resetGameObject) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.scoreboard];
}

// 更新视图
- (void)updateView {
    if (!self.gameImageDictionary) {
        self.gameImageDictionary = [[NSMutableDictionary alloc] init];
    }
    for (id gameObject in self.gameObjects) {
        HMBGameObjectView * imageView = [[HMBGameObjectView alloc] initWithObject:gameObject];
        [self.gameImageDictionary setObject:imageView forKey:[gameObject name]];
        [self pushViewAnimation:imageView];
//        [self.view addSubview:imageView];
    }
}

// 重置游戏
- (void)resetGameObject {
    for (id gameObject in self.gameObjects) {
        [self deleteViewAnimation:[self.gameImageDictionary objectForKey:[gameObject name]]];
        [self.gameImageDictionary removeObjectForKey:[gameObject name]];
    }
    self.gameObjects = nil;
    [self.scoreboard setTitle:@"No start yet!" forState:UIControlStateNormal];
    [self creatGameObject];
}

#pragma mark - 动画效果
// 把位置移到中间，并且颜色变淡。到达后删除视图。
- (void)deleteViewAnimation:(HMBGameObjectView *)view {
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionNone animations:^{
        view.center = self.view.center;
        view.alpha  = 0.2;
    }completion:^(BOOL finished){
        if (finished) {
            [view removeFromSuperview];
        }
    }];
}

// 把视图都移动到中间，然后弹出去(好像初始化视图的时候就把视图放在中间比较好……但是这个那样改动较大，我就……偷懒一下……）
- (void)pushViewAnimation:(HMBGameObjectView *)view {
    CGPoint center = view.center;
    view.alpha     = 0;
    view.center    = self.view.center;
    [self.view addSubview:view];
    [UIView animateWithDuration:1 delay:1 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionNone animations:^{
        view.center = center;
        view.alpha  = 1;
    }completion:nil];
}
@end
