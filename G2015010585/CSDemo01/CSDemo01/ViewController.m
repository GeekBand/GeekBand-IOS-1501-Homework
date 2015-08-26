//
//  ViewController.m
//  CSDemo01
//
//  Created by ZhangBob on 8/8/15.
//  Copyright (c) 2015 ZhangBob. All rights reserved.
//

#import "ViewController.h"
#import "CSAnimal.h"
#import "CSBird.h"
#import "CSFish.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *birdName;
    birdName = @[@"aBird",@"bBird",@"cBird",@"dBire",@"eBird",@"fBird",@"gBird",@"hBird",@"iBird",@"jBird"];
    NSArray *fishName;
    fishName = @[@"aFish",@"bFish",@"cFish",@"dFish",@"eFish",@"fFish",@"gFish",@"hFish",@"iFish",@"jFish"];
    
    NSMutableArray *animalArray = [[NSMutableArray alloc] init];
    for (int counter = 0; counter < 10; counter ++) {
        char genderString = 0;
        if (counter%2 == 0) {
            genderString = "male";
        }
        else{
            genderString = "female";
        }
        CSBird *bird = [[CSBird alloc] init];
        bird.name = birdName[counter];
        bird.weight = 10 + counter/10.0;
        bird.gender = genderString;
        bird.birdColor = [UIColor colorWithRed:(255 - counter*20) green:(0+counter*25) blue:255 alpha:1.0];
        [animalArray addObject:bird];
        
        CSFish *fish = [[CSFish alloc] init];
        fish.name = fishName[counter];
        fish.weight = 10 + counter/10.0;
        fish.gender= genderString;
        fish.fishColor = [UIColor colorWithRed:(255 - counter*20) green:(0+counter*25) blue:255 alpha:1.0];
        [animalArray addObject:fish];
    }
//    for (int counter = 0; counter <10; counter ++) {
//        char genderString = 0;
//        if (counter%2 == 0) {
//            genderString = "male";
//        }
//        else{
//            genderString = "female";
//        }
//        CSFish *fish = [[CSFish alloc] init];
//        fish.name = fishName[counter];
//        fish.weight = 10 + counter/10.0;
//        fish.gender= genderString;
//        fish.fishColor = [UIColor colorWithRed:(255 - counter*20) green:(0+counter*25) blue:255 alpha:1.0];
//        [animalArray addObject:fish];
//
//    }
  
#pragma Mark -Custom ActionOfAnimal Method
    
    for (int counter = 0; counter < [animalArray count]; counter ++) {
        if ([animalArray[counter] isKindOfClass:[CSBird class]]) {
            [animalArray[counter] isBirdFly];
        }
        else if ([animalArray[counter] isKindOfClass:[CSFish class]]){
            [animalArray[counter] isFishSwim];
        }
    }
    
    
    
#pragma Mark - Custom Hunting Method

    NSInteger numOfBirdHunting = 0;
    NSInteger numOfFishHunting = 0;
    NSUInteger randomNumOfHunting = (NSUInteger)(arc4random() %20);
    NSInteger index = 0;
    for (NSUInteger counter = 0; counter < randomNumOfHunting; counter--) {
        index += counter;
        if ([animalArray[counter] isKindOfClass:[CSBird class]]) {
            numOfBirdHunting++;
            CSBird *catchedBird = animalArray[index];
            NSLog(@"%@ is down",catchedBird.name);
            catchedBird = nil;
            [animalArray removeObjectAtIndex:index];
        }else if ([animalArray[counter] isKindOfClass:[CSFish class]]){
            numOfFishHunting++;
            CSFish *catchedFish = animalArray[counter];
            NSLog(@"%@ is down",catchedFish.name);
            catchedFish = nil;
            [animalArray removeObjectAtIndex:index];
        }
    }
    NSLog(@"打下来了%li只鸟，捞到了%li只鱼。",numOfBirdHunting,numOfFishHunting);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
