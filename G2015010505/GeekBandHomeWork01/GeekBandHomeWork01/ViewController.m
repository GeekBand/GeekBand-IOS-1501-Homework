//
//  ViewController.m
//  GeekBandHomeWork01
//
//  Created by Warren on 15/8/13.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "ViewController.h"
#import "WZBird.h"
#import "WZFish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *animalsArray = [[NSMutableArray alloc] initWithCapacity:20];
    for (int i = 0; i < 10; ++i) {
        WZBird *bird = [[WZBird alloc] initWithName:[NSString stringWithFormat:@"bird%i", i] Sex:male weight:1.0+i];
        WZFish *fish = [[WZFish alloc] initWithName:[NSString stringWithFormat:@"fish%i", i] Sex:female weight:1.0+i];
        [animalsArray addObject:bird];
        [animalsArray addObject:fish];
    }
    
    [self ErgodicAnimals:animalsArray];
    [self netFishFromArray:animalsArray];
    [self hurtBirdFromArray:animalsArray];
    
}

- (void)ErgodicAnimals:(NSMutableArray *)array;
{
    for (int i = 0; i < 20; ++i) {
        if ([array[i] isMemberOfClass:[WZBird class]]) {
            [array[i] birdIsFlying];
        } else if ([array[i] isMemberOfClass:[WZFish class]]) {
            [array[i] fishIsSwimming];
        }
    }
}

- (void)netFishFromArray:(NSMutableArray *)array
{
    int killNumber = arc4random() % 11;
    NSLog(@"kill %i fish", killNumber);
    for (int x = 0; x < killNumber; x++) {
        for (WZFish *i in array) {
            if ([i isMemberOfClass:[WZFish class]]) {
                [i animalSpeak];
                [array removeObject:i];
                break;
            }
        }
    }
}

- (void)hurtBirdFromArray:(NSMutableArray *)array
{
    int killNumber = arc4random() % 11;
    NSLog(@"kill %i bird", killNumber);
    for (int x = 0; x < killNumber; x++) {
        for (WZBird *i in array) {
            if ([i isMemberOfClass:[WZBird class]]) {
                [i animalSpeak];
                [array removeObject:i];
                break;
            }
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
