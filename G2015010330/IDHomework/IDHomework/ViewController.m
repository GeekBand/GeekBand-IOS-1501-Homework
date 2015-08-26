//
//  ViewController.m
//  IDHomework
//
//  Created by int2d on 15/8/13.
//  Copyright (c) 2015年 int2d. All rights reserved.
//

#import "ViewController.h"
#import "IDBird.h"
#import "IDFish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *animals = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        
        [animals addObject:[[IDBird alloc] initWithName:[NSString stringWithFormat:@"Bird%i", i]
                                                    sex:arc4random() % 3
                                                 weight:1.70f
                                                  color:[UIColor blueColor]]];
        
        [animals addObject:[[IDFish alloc] initWithName:[NSString stringWithFormat:@"Fish%i", i]
                                                    sex:arc4random() % 3
                                                 weight:1.70f
                                                  color:[UIColor redColor]]];
    }
    
    NSInteger fishCount = 0;
    NSInteger birdCount = 0;
    
    for (int i = 0; i < [animals count]; i++) {
        
        BOOL isCatch = arc4random() % 2;
        
        if ([[animals[i] class] isSubclassOfClass:[IDBird class]]) {
            
            [(IDBird *)animals[i] fly];
            
            //打鸟
            if (isCatch) {
                NSLog(@"%@被打掉", [(IDBird *)animals[i] name]);
                birdCount++;
                [animals removeObjectAtIndex:i];
                i--;
            }
        }else if ([[animals[i] class] isSubclassOfClass:[IDFish class]]){
            
            [(IDFish *)animals[i] swim];
            
            //捕鱼
            if (isCatch) {
                NSLog(@"%@被捕到", [(IDBird *)animals[i] name]);
                fishCount++;
                [animals removeObjectAtIndex:i];
                i--;
            }
        }
    }
    
    NSLog(@"共打掉%li只鸟，捕到%li条鱼", birdCount, fishCount);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
