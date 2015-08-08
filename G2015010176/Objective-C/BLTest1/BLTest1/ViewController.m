//
//  ViewController.m
//  BLTest1
//
//  Created by Will Ge on 8/8/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "ViewController.h"
#import "GWAnimal.h"
#import "GWBird.h"
#import "GWFish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // No.3
    NSMutableArray *animal = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        NSArray *birdNames = @[@"Parrot", @"Pelican", @"Raptor", @"Ural", @"Owls", @"BABY BLUE", @"AIDEN", @"BB", @"DAVE", @"CHILI"];
        GWBird *randomGWBird = [[GWBird alloc] initWithName:birdNames[i] gender:(Gender)(arc4random() % 2) weight:(NSUInteger)(arc4random() % 100)];
        randomGWBird.color = [UIColor whiteColor];
        [animal addObject:randomGWBird];
        
        
        GWFish *randomGWFish = [[GWFish alloc] initWithName:@"Fish" gender:(Gender)(arc4random() % 2) weight:(NSUInteger)(arc4random() % 100)];
        randomGWFish.color = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:1.0];
        [animal addObject:randomGWFish];

        
        // wrong instance methods
//        GWBird *randomGWBird = [[GWBird alloc] init];
//        NSArray *birdNames = @[@"Parrot", @"Pelican", @"Raptor", @"Ural", @"Owls", @"BABY BLUE", @"AIDEN", @"BB", @"DAVE", @"CHILI"];
//        [randomGWBird initAnimal:randomGWBird withName:birdNames[i] withGender:(Gender)(arc4random() % 2) withWeight:(NSUInteger)(arc4random() % 100)];
//        [randomGWBird init:randomGWBird withColor:[UIColor whiteColor]];
//        [animal addObject:randomGWBird];
//        
//        
//        GWFish *randomGWFish = [[GWFish alloc] init];
//        [randomGWFish initAnimal:randomGWFish withName:@"Fish" withGender:(Gender)(arc4random() % 2) withWeight:(NSUInteger)(arc4random() % 100)];
//        [randomGWFish init:randomGWFish withColor:[UIColor whiteColor]];
//        [animal addObject:randomGWFish];

    }
    
    for (int i = 0; i < [animal count]; i++) {
        if ([animal[i] isKindOfClass:[GWBird class]]) {
            [animal[i] fly];
        } else if ([animal[i] isKindOfClass:[GWFish class]]) {
            [animal[i] swim];
        }
    }
    
    
    // No.4
    int fishCount = 0;
    int birdCount = 0;
    NSUInteger randomRemoveNumber = (NSUInteger)(arc4random() % 20);
    for (NSUInteger i = randomRemoveNumber; i > 0; i--) {
        
        NSUInteger randomIndex = (NSUInteger)(arc4random() % i);
        [animal removeObjectAtIndex:randomIndex];
        if ([animal[randomIndex] isKindOfClass:[GWBird class]]) {
            birdCount++;
        } else if ([animal[randomIndex] isKindOfClass:[GWFish class]]) {
            fishCount++;
        }
    }
    
    NSLog(@"fishCount:%d, birdCount:%d, randomRemoveNumber:%lu, [animal count]:%lu", fishCount, birdCount, (unsigned long)randomRemoveNumber, (unsigned long)[animal count]);
}
         

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
