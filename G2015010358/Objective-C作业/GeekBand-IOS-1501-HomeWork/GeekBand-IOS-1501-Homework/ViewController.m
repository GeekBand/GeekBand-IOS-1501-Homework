//
//  ViewController.m
//  GeekBand-IOS-1501-Homework
//
//  Created by ld on 15/8/11.
//  Copyright (c) 2015年 lvdong. All rights reserved.
//

#import "ViewController.h"
#import "LDBird.h"
#import "LDFish.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSMutableArray *animals = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        LDBird *newBird = [[LDBird alloc] init];
        newBird.name = [NSString stringWithFormat:@"Bird %d",i];
        newBird.sex = i%2;
        LDFish *newFish = [[LDFish alloc] init];
        newFish.name = [NSString stringWithFormat:@"Fish %d",i];
        newFish.sex = i%2;
        [animals addObject:newFish];
        [animals addObject:newBird];
    }
    
    
    for (int i=0; i<[animals count]; i++) {
        id animal = [animals objectAtIndex:i];
        if ( [[animal class] isSubclassOfClass:[LDBird class]] ) {
            [animal fly];
        }
        else if ( [[animal class] isSubclassOfClass:[LDFish class]] ) {
            [animal swim];
        }
    }
    
    int n=9;
    for (int i=0; i<n; i++) {
        int randomi = arc4random() % animals.count;
        id animal = [animals objectAtIndex:randomi];
        if ([[animal class] isSubclassOfClass:[LDBird class]]) {
            NSLog(@"我打到了一只名叫 %@ 的鸟",((LDBird *)animal).name);
        }
        else if ( [[animal class] isSubclassOfClass:[LDFish class]] ) {
            NSLog(@"我捞到了一条名叫 %@ 的鱼",((LDFish *)animal).name);
        }
        [animals removeObjectAtIndex:randomi];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
