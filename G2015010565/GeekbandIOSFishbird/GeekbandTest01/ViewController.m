//
//  ViewController.m
//  GeekbandTest01
//
//  Created by huzhigang on 15/8/8.
//  Copyright © 2015年 huzhigang. All rights reserved.
//

#import "ViewController.h"
#import <GameKit/GameKit.h>

@interface ViewController ()

@end

@implementation ViewController

-(void)makeFishAndBird
{
    //_fishAndbirds = [[NSMutableArray alloc] init];
    NSLog(@"I will make 10 fish and 10 birds");
    for (int i = 0; i<10; i++) {
        [_fishAndbirds addObject:[[Fish alloc] init]];
        [_fishAndbirds addObject:[[Bird alloc] init]];
    }
    
    for (Animal* animal in _fishAndbirds) {
        if ([animal isMemberOfClass:[Bird class]]) {
            //[(Bird*)animal fly];
        }
        else if([animal isMemberOfClass:[Fish class]])
        {
            [(Fish *)animal swim];
        }
            
    }
}

-(void)getFish
{
    GKARC4RandomSource *random = [[GKARC4RandomSource alloc]init];
    
    NSInteger fishNumber = 0;
    for (Animal *animal in _fishAndbirds) {
        if ([animal isMemberOfClass:[Fish class]]) {
            fishNumber++;
        }
    }
    
    NSUInteger fishWantNumber = [random nextIntWithUpperBound:fishNumber];
    NSUInteger fishGet = 0;
    NSLog(@"I want get %li fishes", fishWantNumber);
    
    fishGet=0;
    
    for (int i =([_fishAndbirds count] -1); i>=0; i--) {
        if (fishGet<fishWantNumber) {
            if ([[_fishAndbirds objectAtIndex:i] isMemberOfClass:[Fish class]]) {
                [_fishAndbirds removeObjectAtIndex:i];
                fishGet++;
                NSLog(@"I get NO. %li fish",fishGet);
            }
        }
        else
        {
            break;
        }

    }
    
}

-(void)getBird
{
    GKARC4RandomSource *random = [[GKARC4RandomSource alloc]init];
    
    NSInteger birdNumber = 0;
    for (Animal *animal in _fishAndbirds) {
        if ([animal isMemberOfClass:[Bird class]]) {
            birdNumber++;
        }
    }
    
    NSUInteger birdWantNumber = [random nextIntWithUpperBound:birdNumber];
    NSUInteger birdGet = 0;
    NSLog(@"I want get %li birds", birdWantNumber);
    
    birdGet=0;
    
    for (int i =([_fishAndbirds count] -1); i>=0; i--) {
        if (birdGet<birdWantNumber) {
            if ([[_fishAndbirds objectAtIndex:i] isMemberOfClass:[Bird class]]) {
                [_fishAndbirds removeObjectAtIndex:i];
                birdGet++;
                NSLog(@"I get NO. %li bird",birdGet);
            }
        }
        else
        {
            break;
        }
        
    }
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
    _fishAndbirds = [[NSMutableArray alloc] init];
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)MakeAnimal:(id)sender {
    [self makeFishAndBird];
}

- (IBAction)GetFish:(id)sender {
    [self getFish];
}


@end
