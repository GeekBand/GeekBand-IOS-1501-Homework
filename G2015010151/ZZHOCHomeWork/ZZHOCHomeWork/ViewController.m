//
//  ViewController.m
//  ZZHOCHomeWork
//
//  Created by 张志华 on 15/8/15.
//  Copyright (c) 2015年 张志华. All rights reserved.
//

#import "ViewController.h"
#import "ZZHFish.h"
@interface ViewController (){
    NSMutableArray *fishArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    fishArray = [NSMutableArray array];
    for (int i = 0; i < 10 ; i++) {
        ZZHFish *fish = [[ZZHFish alloc] init];
        fish.name = [NSString stringWithFormat:@"fish%i",i];
        [fishArray addObject:fish];
    }
    
    for (ZZHFish *fish in fishArray){
        [fish bleat];
        [fish swim];
    }
    
    UIButton *catchFishButton = [[UIButton alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2, 200, 200, 100)];
    catchFishButton.backgroundColor = [UIColor redColor];
    [catchFishButton setTitle:@"Catch Fish !!!" forState:UIControlStateNormal];
    [catchFishButton addTarget:self action:@selector(catchFish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:catchFishButton];
}

- (void)catchFish{
    if(fishArray.count == 0){
        NSLog(@"there is no fish");
        return;
    }
    
    int numbersOfCatchedFish = arc4random() % fishArray.count + 1;
    
    for (int i = 0; i < numbersOfCatchedFish ; i++) {
        int theNumberOfCatchedFish = arc4random() % fishArray.count;
        ZZHFish *fish = [fishArray objectAtIndex:theNumberOfCatchedFish];
        [fish bleat];
        NSLog(@"%@ is catched",fish.name);
        [fishArray removeObject:fish];
        fish = nil;
    }
    
    NSLog(@"%i fish is catched",numbersOfCatchedFish );
}

@end
