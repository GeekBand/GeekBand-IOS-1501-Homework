//
//  ViewController.m
//  OC Homework
//
//  Created by 张弢 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "ViewController.h"
#import "BZBird.h"
#import "BZFish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self generateBirdsAndFishes];
    [self showBirdsInfo];
    [self showFishesInfo];

    for (id animal in _animals)
    {
        if ([animal isKindOfClass:[BZBird class]])
        {
            BZBird *bird = (BZBird *)animal;
            [bird startFlying];
        } else if ([animal isKindOfClass:[BZFish class]])
        {
            BZFish *fish = animal;
            [fish startSwimming];
        }
    }
}

-(void) generateBirdsAndFishes
{
    if (_birds) {
        [_birds removeAllObjects];
    } else {
        _birds = [[NSMutableArray alloc] init];
    }
    
    if (_fishes) {
        [_fishes removeAllObjects];
    } else {
        _fishes = [[NSMutableArray alloc] init];
    }
    
    if (_animals) {
        [_animals removeAllObjects];
    } else {
        _animals = [[NSMutableArray alloc] init];
    }
    
    for (int i = 0; i < 10; i++)
    {
        UIColor *testColor = [self randomColor];
        
        BZBird *bird = [[BZBird alloc] initWithName:[self randomName]
                                             gender:[self randomGender]
                                             weight:[self randomWeight]
                                              color:testColor];
        [_birds addObject:bird];
        [_animals addObject:bird];
        
        BZFish *fish = [[BZFish alloc] initWithName:[self randomName]
                                             gender:[self randomGender]
                                             weight:[self randomWeight]
                                              color:[self randomColor]];
        [_fishes addObject:fish];
        [_animals addObject:fish];
    }
}

-(NSString *) randomName
{
    int len = arc4random() % 10 + 1;
    NSMutableString *name = [[NSMutableString alloc] init];
    for (int i = 0; i < len; i++) {
        char baseChar;
        if (i == 0) {
            baseChar = 'A';
        } else {
            baseChar = 'a';
        }
        char c = baseChar + arc4random() % 26;
        [name appendFormat:@"%c", c];
    }
    return name;
}

-(BZGender) randomGender
{
    int value = arc4random() % 3 - 1;
    return (value >= 0 ? male : female);
}

-(NSInteger) randomWeight
{
    return arc4random() % 10 + 1;
}

-(UIColor *) randomColor
{
    CGFloat r = arc4random() % 256 / 255.0;
    CGFloat g = arc4random() % 256 / 255.0;
    CGFloat b = arc4random() % 256 / 255.0;
    return [[UIColor alloc] initWithRed:r green:g blue:b alpha:1.0];
}

-(void) showBirdsInfo {
    long num = 10 - [_birds count];
    self.birdInfoLabel.text = [[NSString alloc] initWithFormat:@"已抓到%ld只鸟", num];
}

-(void) showFishesInfo {
    long num = 10 - [_fishes count];
    self.fishInfoLabel.text = [[NSString alloc] initWithFormat:@"已抓到%ld条鱼", num];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shootBird:(id)sender {
    int num = arc4random() % ([_birds count] + 1);
    for (int i=0; i<num; i++) {
        int index = arc4random() % [_birds count];
        [_animals removeObject:_birds[index]];
        [_birds removeObjectAtIndex:index];
    }
    
    [self showBirdsInfo];
}

- (IBAction)catchFish:(id)sender {
    int num = arc4random() % ([_fishes count] + 1);
    for (int i=0; i<num; i++) {
        int index = arc4random() % [_fishes count];
        [_animals removeObject:_fishes[index]];
        [_fishes removeObjectAtIndex:index];
    }
    
    [self showFishesInfo];
}

- (IBAction)reset:(id)sender {
    [self generateBirdsAndFishes];
    [self showBirdsInfo];
    [self showFishesInfo];
}

@end
