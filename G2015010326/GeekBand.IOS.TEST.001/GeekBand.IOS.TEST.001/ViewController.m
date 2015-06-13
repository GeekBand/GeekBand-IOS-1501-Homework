//
//  ViewController.m
//  GeekBand.IOS.TEST.001
//
//  Created by as4 on 15/6/13.
//  Copyright (c) 2015年 as4. All rights reserved.
//

#import "ViewController.h"
#import "ModelGame.h"

@interface ViewController ()
@end

@implementation ViewController

- (IBAction)beginGame:(id)sender {
    self.game = nil;
    [self.game beginGame];
}

- (IBAction)huntedFish:(id)sender {
    if ([self.game countOfAnimals] == 0) {
        return;
    }
    NSUInteger count = arc4random() % [self.game countOfAnimals] + 1;
    if (count) {
        [self.game huntedFishes:count];
    }
}

- (IBAction)huntedBird:(id)sender {
    if ([self.game countOfAnimals] == 0) {
        return;
    }
    NSUInteger count = arc4random() % [self.game countOfAnimals] + 1;
    if (count) {
        [self.game huntedBirds:count];
    }
}

- (ModelGame*)game
{
    if (!_game) {
        _game = [[ModelGame alloc] init];
    }
    return _game;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.game beginGame];
    
//    [self.view addSubview:self.ereaForSky];
//    [self.view addSubview:self.ereaForOcean];
//    
//    NSLog(@"%@", [NSString class]);
//    [NSString stringWithFormat:@"🐟 🐠 🐡"];
//    [NSString stringWithFormat:@"🐦"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
