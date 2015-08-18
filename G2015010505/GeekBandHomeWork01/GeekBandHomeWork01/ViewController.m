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
        WZBird *bird = [[WZBird alloc] initWithName:[NSString stringWithFormat:@"bird%i", i]
                                        sexToGender:male
                                             weight:1.0+i];
        WZFish *fish = [[WZFish alloc] initWithName:[NSString stringWithFormat:@"fish%i", i]
                                        sexToGender:female
                                             weight:1.0+i];
        [animalsArray addObject:bird];
        [animalsArray addObject:fish];
    }
    
    [self ErgodicAnimals:animalsArray];
    [self killAnimalFromAnimalsArray:animalsArray withAnimalsTypeClass:[WZFish class]];
    [self killAnimalFromAnimalsArray:animalsArray withAnimalsTypeClass:[WZBird class]];
    
}

- (void)ErgodicAnimals:(NSMutableArray *)animalsArray;
{
//    for (int i = 0; i < 20; ++i) {
//        if ([array[i] isMemberOfClass:[WZBird class]]) {
//            [array[i] birdIsFlying];
//        } else if ([array[i] isMemberOfClass:[WZFish class]]) {
//            [array[i] fishIsSwimming];
//        }
//    }
// This Method maybe more better
    for (id animal in animalsArray) {
        if ([animal isMemberOfClass:[WZBird class]]) {
            [(WZBird *)animal birdIsFlying];
        } else if ([animal isMemberOfClass:[WZFish class]]) {
            [(WZFish *)animal fishIsSwimming];
        }
    }
}

//减少重复代码
- (void)killAnimalFromAnimalsArray:(NSMutableArray *)animalsArray withAnimalsTypeClass:(id)animalsTypeClass
{
    unsigned killNumber = arc4random() % 10 +1;
    if ([animalsTypeClass isEqual:[WZBird class]]) {
        NSLog(@"kill %i Bird", killNumber);
    } else if ([animalsTypeClass isEqual:[WZFish class]]) {
        NSLog(@"kill %i Fish", killNumber);
    }
    
    for (int i = 0; i < killNumber; i++) {
        for (id animal in animalsArray) {
            if ([animal isMemberOfClass:animalsTypeClass]) {
                [animal animalSpeak];
                [animalsArray removeObject:animal];
                break;
            }
        }
    }
}


//通过上方方法替代
//- (void)netFishFromFishsArray:(NSMutableArray *)fishsArray
//{
//    unsigned killNumber = arc4random() % 10+1;
//    NSLog(@"kill %i fish", killNumber);
//    for (int x = 0; x < killNumber; x++) {
//        for (id i in fishsArray) {
//            if ([i isMemberOfClass:[WZFish class]] && [fishsArray count]) {
//                [i animalSpeak];
//                [fishsArray removeObject:i];
//                break;
//            }
//        }
//    }
//    
////    [fishsArray makeObjectsPerformSelector:@selector(killAnimalFromAnimalsArray:withAnimalsTypeClass:)];  可以通过delegate实现
//}
//
//- (void)hurtBirdFromBirdsArray:(NSMutableArray *)birdsArray
//{
//    unsigned killNumber = arc4random() % 10+1;
//    NSLog(@"kill %i bird", killNumber);
//    for (int x = 0; x < killNumber; x++) {
//        for (id i in birdsArray) {
//            if ([i isMemberOfClass:[WZBird class]] && [birdsArray count]) {
//                [i animalSpeak];
//                [birdsArray removeObject:i];
//                break;
//            }
//        }
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
