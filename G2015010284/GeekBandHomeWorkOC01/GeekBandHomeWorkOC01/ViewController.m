//
//  ViewController.m
//  GeekBandHomeWorkOC01
//
//  Created by Liang Zisheng on 9/5/15.
//  Copyright (c) 2015 ALMOND. All rights reserved.
//

#import "ViewController.h"
#import "IZBird.h"
#import "IZFish.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *animalArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        IZBird *bird = [[IZBird alloc] initWithInfoDictionary:@{@"Name":[NSString stringWithFormat:@"Bird%d", i], @"Gender":[NSNumber numberWithInt:male], @"Weight":@100, @"Color":@"Red"}];
        IZFish *fish = [[IZFish alloc] initWithInfoDictionary:@{@"Name":[NSString stringWithFormat:@"Fish%d", i], @"Gender":[NSNumber numberWithInt:male], @"Weight":@100, @"Color":@"Red"}];
        [animalArray addObject:bird];
        [animalArray addObject:fish];
    }
    for (IZAnimal *animal in animalArray) {
        if ([animal isKindOfClass:[IZBird class]]) {
            [(IZBird *)animal flying];
        }
        if ([animal isKindOfClass:[IZFish class]]) {
            [(IZFish *)animal swimming];
        }
    }
    
    NSMutableArray *fishPool = [self fishPoolInitialize:100];
    [self catchFish:10 from:fishPool];

    
}

- (NSMutableArray *)fishPoolInitialize:(NSUInteger)num {
    NSMutableArray *fishArray = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < num; i++) {
        IZFish *fish = [[IZFish alloc] initWithInfoDictionary:@{@"Name":[NSString stringWithFormat:@"Fish%lu", (unsigned long)i], @"Gender":[NSNumber numberWithInt:(arc4random()%2)], @"Weight":[NSNumber numberWithInt:(arc4random()%100)], @"Color":@"Red"}];
        [fishArray addObject:fish];
    }
    
    return fishArray;

}

- (void)catchFish:(NSUInteger)fishNum from:(NSMutableArray *)fishArray {
    
    // make sure fishNum <= fishArray.count
    if (fishNum > [fishArray count]) {
        NSLog(@"Warning: input fishNum > numOfFishExist, auto set the fishNum = numOfFishExist");
        fishNum = [fishArray count];
    }
    
    // generate a random number set to represent the fish's index
    NSMutableSet *indexSet = [NSMutableSet set];
    while ([indexSet count] < fishNum) {
        [indexSet addObject:[NSNumber numberWithInt:(arc4random()%fishNum)]];
    }
    
    // catch fish
    // log
    NSLog(@"Total num:%lu", fishNum);
    for (NSNumber *num in indexSet) {
        int indexNum = [num intValue];
        NSLog(@"Fish:%@ is being catch", [fishArray[indexNum] name]);
        [fishArray removeObjectAtIndex:indexNum];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
