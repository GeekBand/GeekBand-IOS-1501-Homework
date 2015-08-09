//
//  ViewController.m
//  LYObjectiveC
//
//  Created by zero on 15/8/8.
//  Copyright (c) 2015年 zero. All rights reserved.
//

#import "ViewController.h"
#import "LYBird.h"
#import "LYFish.h"
#import "LYAnimal.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *name = @[@"alice",@"bill",@"cindy",@"dan",@"ella",@"furry",@"gin",@"huryy",@"ice",@"julia",
                      @"anni",@"baby",@"cici",@"dim",@"eson",@"funky",@"glory",@"happy",@"immu",@"jane"];
    NSArray *color = @[@"black",@"white",@"red"];
    NSMutableArray *animals = [[NSMutableArray alloc] initWithCapacity:20];
    
    for (int i = 0; i<20; i++) {
        if (i < 10) {
            LYBird *bird = [[LYBird alloc] initWithName:name[i]
                                              andWeight:arc4random()%30+i
                                                    sex:(animalSex)arc4random()%2];
            bird.birdColor = color[arc4random() % 3];
            [animals addObject:bird];
        }else{
            LYFish *fish = [[LYFish alloc] initWithName:name[i] andWeight:arc4random() % 10
                                                    sex:(animalSex)2];
            fish.fishColor = color[arc4random() % 3];
            [animals addObject:fish];
        }
    }
    
    for (int j = 0; j < [animals count]; j++) {
        if ([animals[j] isKindOfClass:[LYBird class]]) {
            [(LYBird *)animals[j] flyingBird];
            NSLog(@"Animal No.%d name is %@,weight is %lu, has %@ color, gender is %@",j+1,[animals[j] name],[animals[j] weight],[animals[j] birdColor],[animals[j] sex]);
        }
        else if ([animals[j] isKindOfClass:[LYFish class]])
        {
            [animals[j] swimmingFish];
        }
    }
    
    int n = arc4random() % 20;
    int fishcount = 0;
    int birdcount = 0;
    for (int k = 0; k < n; k++) {
        NSUInteger pickIndex = arc4random() % [animals count];
        if ([animals[pickIndex] isKindOfClass:[LYBird class]])
        {
            birdcount++;
        }else if ([animals[pickIndex] isKindOfClass:[LYFish class]])
            fishcount++;
        [animals removeObjectAtIndex:pickIndex];
    }
    NSLog(@"pick %d animals,numbers of bird %d and fish %d,remain animals %lu",n,birdcount,fishcount,[animals count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
