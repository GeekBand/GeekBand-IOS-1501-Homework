//
//  main.m
//  测试
//
//  Created by 陈铭嘉 on 15/8/8.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Bird.h"
#import "Fish.h"
#import "Method1.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       
        
#pragma mark --------第三题部分
        
        
        NSMutableArray *array = [NSMutableArray array];

        for (int i = 0; i < 10; i++) {
            Bird *bird = [[Bird alloc]initWithName:[NSString stringWithFormat:@"BIRD%d",i] WithWeight:i WithSex:male WithColor:@"红"];
            Fish *fish = [[Fish alloc]initWithName:[NSString stringWithFormat:@"Fish%d",i] WithWeight:i WithSex:male WithColor:@"红"];
            [array addObject:bird];
            [array addObject:fish];
        }
        
        NSMutableArray *fisharray = [NSMutableArray array];
        NSMutableArray *birdarray = [NSMutableArray array];
        
        for (Bird* bird in array) {
            if ([bird isKindOfClass:[Bird class]]) {
                [bird Fly];
                [birdarray addObject:bird];
            }
        }
        
        for (Fish* fish in array) {
            if ([fish isKindOfClass:[Fish class]]) {
                [fish Swim];
                [fisharray addObject:fish];
            }
        }
        

        
#pragma mark -----第四题部分
        
        Method1 *method = [[Method1 alloc]init];
        [method Question4forBird:birdarray];
        [method Question4forBird:birdarray];
        [method Question4forBird:birdarray];
        [method Question4forBird:birdarray];
        [method Question4forBird:birdarray];
        
        [method Question4forBird:fisharray];
        [method Question4forBird:fisharray];
        [method Question4forBird:fisharray];
        [method Question4forBird:fisharray];
        [method Question4forBird:fisharray];


        
    }
    return 0;
}



