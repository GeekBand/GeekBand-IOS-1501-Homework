//
//  ViewController.m
//  Assignment1
//
//  Created by 杨立 on 15/8/10.
//  Copyright (c) 2015年 杨立. All rights reserved.
//

#import "ViewController.h"
#import "Fish.h"
#import "Bird.h"
#import "InitWithColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *animal = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        NSArray *birdName = @[@"Zhangsan", @"Lisi", @"Wangmazi", @"Liming", @"Wanglei", @"Hanmeimei", @"Yiyi", @"Erer", @"Sansan", @"Sisi"];
        NSArray *color = @[@"Red", @"Orange", @"Yellow", @"Green", @"Cyan", @"Blue", @"Purple"];
        Bird *bird = [[Bird alloc] initWithColor:color[(arc4random() % [color count])] WithName:birdName[i] WithGender:(Gender)(arc4random() & 3) WithWeight: (NSUInteger)(arc4random() % 100)];
        [animal addObject:bird];
        
        NSArray *fishName = @[@"Wuwu", @"Liuliu", @"Qiqi", @"Baba", @"Jiujiu", @"Baby", @"Girls", @"Boys", @"Ironman", @"Capatan"];
        Fish *fish = [[Fish alloc] initWithColor:color[(arc4random() % [color count])] WithName:fishName[i] WithGender:(Gender)(arc4random() % 3) WithWeight:(NSUInteger)(arc4random() % 100)];
        [animal addObject:fish];
    }
    
    for(int i = 0; i < [animal count]; i++)
    {
        if ([animal[i] isKindOfClass:[Bird class]]) {
            [animal[i] flying];
           NSLog(@"This is a bird, with %@ color, %lu weight, and you can call it %@", [animal[i] color], (unsigned long)[animal[i] weight], [animal[i] name]);
        }else if ([animal[i] isKindOfClass:[Fish class]]){
            [animal[i] swimming];
            NSLog(@"This is a fish, with %@ color, %lu weight, and you can call it %@", [animal[i] color], (unsigned long)[animal[i] weight], [animal[i] name]);
        }
    }
    
    int fishCount = 0;
    int birdCount = 0;
    NSUInteger getAnimalNumber = (NSUInteger)(arc4random() % [animal count]);
    for (NSUInteger i = getAnimalNumber; i > 0; i--) {
        
        NSUInteger animalIndex = (NSUInteger)(arc4random() % [animal count]);
        if ([animal[animalIndex] isKindOfClass:[Bird class]]) {
            birdCount++;
        } else if ([animal[animalIndex] isKindOfClass:[Fish class]]) {
            fishCount++;
        }
        [animal removeObjectAtIndex:animalIndex];
    }
    // FIXME: Print a more readable result.
    NSLog(@"fishCount:%d, birdCount:%d, randomRemoveNumber:%lu, [animal count]:%lu", fishCount, birdCount, (unsigned long)getAnimalNumber, (unsigned long)[animal count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
