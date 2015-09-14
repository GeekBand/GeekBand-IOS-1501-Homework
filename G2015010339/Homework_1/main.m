//
//  main.m
//  Homework_1
//
//  Created by ZhouJiahui on 8/17/15.
//  Copyright (c) 2015 ZhouJiahui. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Bird.h"
#import "Fish.h"
#import "Animal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

#pragma mark - homework2
        //init the array
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        //create ten birds and ten fishes
        for (NSInteger i = 0; i < 10; i++) {
            Bird *bird = [[Bird alloc]initWithName:[NSString stringWithFormat:@"bird%li",(long)i] Sex:male Weight:10];
            bird.color = @"yellow";
            
            Fish *fish = [[Fish alloc]initWithName:[NSString stringWithFormat:@"fish%li",(long)i] Sex:female Weight:5];
            fish.color = @"red";
            
            [array addObject:fish];
            [array addObject:bird];
        }

#pragma mark - homework3
            //loop within the array
            for (NSInteger i = 0; i < [array count]; i++) {
                id arrayItem = array[i];
                
                if ([arrayItem isKindOfClass:[Bird class]]) {
                    Bird *bird = arrayItem;
                    
                    NSLog(@"Name:%@/t Color:%@/t Sex:%u/t Weight:@li/n the bird is %ld",
                          bird.name,
                          bird.color,
                          bird.sex,
                          (long)bird.weight,
                          [bird fly]);
                
                }//if statement for bird
                
                
                if ([arrayItem isKindOfClass:[Fish class]]) {
                    Fish *fish = arrayItem;
                    NSLog(@"Name:%@/t Color:%@/t Sex:%u/t Weight:@li/n the bird is %ld",
                          fish.name,
                          fish.color,
                          fish.sex,
                          (long)fish.weight,
                          [fish swim]);
                }//if statement for fish
            }// for
#pragma mark - homework4
        int totalNum = (arc4random() % 20) + 1;
        
        int fishNum = 0;
        int birdNum = 0;
        
        for (NSInteger i = totalNum; i > 0; i--) {
            NSInteger index = (NSInteger)(arc4random() % i);
            id arrayItem = array[index];
            
            if ([arrayItem isKindOfClass:[Bird class]]) {
                fishNum++;
            }
            
            if ([arrayItem isKindOfClass:[Fish class]]) {
                birdNum++;
            }
            
            [array removeObjectAtIndex:index];
            
           // [arrayItem release];
            
            arrayItem = nil;
        }
        
        NSLog(@"fish number is %i,bird number is %i", fishNum, birdNum);
        
    }
    return 0;
}
