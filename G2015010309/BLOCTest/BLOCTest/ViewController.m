//
//  ViewController.m
//  BLOCTest
//
//  Created by HeJay on 8/10/15.
//  Copyright (c) 2015 Star. All rights reserved.
//

#import "ViewController.h"
#import "BLFish.h"
#import "BLBird.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 10; i++) {
        [mutableArray addObject:[[BLFish alloc] init]];
        [mutableArray addObject:[[BLBird alloc] init]];
    }
    
    for (NSInteger i = 0; i < [mutableArray count]; i++) {
        if ([[[mutableArray objectAtIndex:i] class] isSubclassOfClass:[BLBird class]]) {
            [[mutableArray objectAtIndex:i] fly:[NSString stringWithFormat:@"bird %li fly", i]];
        } else if ([[[mutableArray objectAtIndex:i] class] isSubclassOfClass:[BLFish class]]) {
            [[mutableArray objectAtIndex:i] swim:[NSString stringWithFormat:@"fish %li swim", i]];
        }
    }
    
    // catch fishes
    NSInteger fishNumber = arc4random() % 10;
    NSMutableIndexSet *fishMutableSet = [[NSMutableIndexSet alloc] init];
    NSInteger numberOfArray = [mutableArray count];
    while ([fishMutableSet count] != fishNumber) {
        NSInteger fishCount = arc4random() % numberOfArray;
        if ([[[mutableArray objectAtIndex:fishCount] class] isSubclassOfClass:[BLFish class]]) {
            [fishMutableSet addIndex:fishCount];
        }
    }
    
    [mutableArray removeObjectsAtIndexes:fishMutableSet];
    NSLog(@"%li fishes has been caught", fishNumber);
    
    // catch birds
    NSInteger birdNumber = arc4random() % 10;
    NSMutableIndexSet *birdMutableSet = [[NSMutableIndexSet alloc] init];
    numberOfArray = [mutableArray count];
    while ([birdMutableSet count] != birdNumber) {
        NSInteger birdCount = arc4random() % numberOfArray;
        if ([[[mutableArray objectAtIndex:birdCount] class] isSubclassOfClass:[BLBird class]]) {
            [birdMutableSet addIndex:birdCount];
        }
    }
    
    [mutableArray removeObjectsAtIndexes:birdMutableSet];
    NSLog(@"%li birds has been caught", birdNumber);
    NSLog(@"The End");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
