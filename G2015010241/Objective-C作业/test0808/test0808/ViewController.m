//
//  ViewController.m
//  test0808
//
//  Created by snddfhv on 15/8/9.
//  Copyright © 2015年 snddfhv. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code start
    
    NSMutableArray *animals = [[NSMutableArray alloc]init];
    
    // 上帝创造了10只鱼和10只鸟
    for (int i=0; i<20; i++) {
        if (i<10) { // 添加鸟
            // 生成一个鸟，性别/体重/颜色都随机
            TBird *bird = [[TBird alloc]initWithName:[NSString stringWithFormat:@"小鸟%d号",i]
                                           andGender:(i%2==0)?TAnimalGenderFemale:TAnimalGenderMale
                                           andWeight:(i+10)/5.0f
                                            andColor:(i%2==0)?TAnimalColorRed:TAnimalColorGreen];
            [animals addObject:bird]; // 将小鸟添加到数组
        } else { // 添加鱼
            // 生成一条鱼，性别/体重/颜色都随机
            TFish *fish = [[TFish alloc]initWithName:[NSString stringWithFormat:@"小鱼%d号",i-10]
                                           andGender:(i%2==0)?TAnimalGenderFemale:TAnimalGenderMale
                                           andWeight:(i+10)/4.0f
                                            andColor:(i%2==0)?TAnimalColorRed:TAnimalColorGreen];
            [animals addObject:fish]; // 将小鱼添加到数组
            
        }
    }
    
    // 遍历数组
    for (TAnimal *animal in animals) {
        if ([animal isKindOfClass:[TBird class]]) {
            TBird *bird = (TBird *)animal;
            [bird fly];
        } else {
            TFish *fish = (TFish *)animal;
            [fish swim];
        }
//        int value = arc4random() % 2;
//        NSLog(@"%d", value);
    }
    
    
    __block NSInteger shootBirdCount = 0; // 打的小鸟数目
    __block NSInteger catchFishCount = 0; // 捕的小鱼数目
    
    NSLog(@"第4题: 小明一会儿打鸟会儿捕鱼");
//    for (TAnimal *animal in animals) {
//        int value = arc4random() % 2;
//        if ([animal isKindOfClass:[TBird class]]) {
//            shootBirdCount += value;
//        } else {
//            catchFishCount += value;
//        }
//        [animals removeObject:animal];
//    }

//    NSEnumerator *en = [animals objectEnumerator];
//    TAnimal *animal;
//    while (animal = [en nextObject]) {
//        int value = arc4random() % 2;
//        if ([animal isKindOfClass:[TBird class]]) {
//                shootBirdCount += value;
//        } else {
//            catchFishCount += value;
//        }
//        [animals removeObject:animal];
//    }
    // 这里使用逆序哦。。。
    [animals enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        TAnimal *animal = (TAnimal *)obj;
        int value = arc4random() % 2;
        // NSLog(@"%@----%d----%lu", [animal name], value, (unsigned long)idx);
        if (value == 1) {
            if ([animal isKindOfClass:[TBird class]]) {
                shootBirdCount += 1;
            } else {
                catchFishCount += 1;
            }
            [animals removeObject:animal]; // 小鱼或小鸟 game over
        }
    }];
    
    NSLog(@"小明一共打了%lu只鸟，捕了%lu只鱼。", shootBirdCount, catchFishCount);
    NSLog(@"空中还剩%lu只鸟，小河中还剩%lu只鱼。", animals.count, animals.count);
    
    
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> my code end
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
