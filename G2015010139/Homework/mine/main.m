//
//  main.m
//  Homework
//
//  Created by john on 15/7/31.
//  Copyright (c) 2015年 john. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MyBird.h"
#import "MyFish.h"

int main(int argc, char * argv[]) {
    
    
    @autoreleasepool {
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10 ; i++) {
            //add bird
            [array addObject:[[MyBird alloc] initWithName:[NSString stringWithFormat:@"%i", i + 1]]];
            //add fish
            [array addObject:[[MyFish alloc] initWithName:[NSString stringWithFormat:@"%i", i + 1]]];
        }
        
        for (MyAnimal *animal in array) {
            [animal speak];
            if([[animal class] isSubclassOfClass:[MyBird class]]) {
                [animal fly];
            } else {
                [animal swim];
            }
        }
        
        char input[100];
        int numberOfFishesCatched = 0;
        int numberOfBirdsCatched = 0;
        do {
            if ([array count] == 0) {
                break;
            }
            NSLog(@"Do you want to catch a fish or a bird?(y or n)");
            scanf("%s", input);
            NSString *str = [NSString stringWithFormat:@"%s", input];
            if ([str  isEqual: @"y"]) {
                int catch = arc4random() % [array count];
                if ( [[[array objectAtIndex:catch] class] isSubclassOfClass:[MyFish class]] ) {
                    NSLog(@"You've caught a fish!\n");
                    numberOfFishesCatched++;
                } else {
                    NSLog(@"You've caught a fish!\n");
                    numberOfBirdsCatched++;
                }
                [array removeObjectAtIndex:catch];
            } else if ([str isEqual:@"n"]) {
                break;
            } else {
                NSLog(@"Input Error, Please reenter!\n");
            }
        } while ([array count] > 0);
        if ([array count] == 0) {
            NSLog(@"Sorry, there's no fish or bird to catch!!!\n");
        }
        NSLog(@"You've catch %i fish(es) and %i bird(s)!\n", numberOfFishesCatched, numberOfBirdsCatched);
        //return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
    return 0;
}
