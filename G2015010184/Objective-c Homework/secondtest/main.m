//
//  main.m
//  secondtest
//
//  Created by 盛钰 on 15/8/13.
//  Copyright (c) 2015年 shengyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fish.h"
#import "bird.h"
#import "function.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
      //第三题
        NSMutableArray *animalArray = [NSMutableArray array];
        for (int i=0; i<10; i++) {
            int tempname = i;
            NSString *namestr = [NSString stringWithFormat:@"%d" , tempname];
            
            [animalArray addObject: ([[bird alloc ]initWithName:namestr animalType:@"bird"])];
            
            [animalArray addObject: ([[fish alloc ]initWithName:namestr animalType:@"fish"])];
        }
        
        //loop
        for (id eachAnimal in animalArray) {
           //  NSLog(@"我是%@",[eachAnimal name]);
           // [eachAnimal sound];
            if ([[eachAnimal class] isSubclassOfClass:[bird class]]){
               
              //  [bird fly];
            }else{
              //  [fish swim];
            }
        }
        //第三题结束
        
        //第四题
        //返回选择的数组下标
        NSMutableSet *captureAnimalSet = [function getRandomSetFormArray:(animalArray)];
       //显示数量
        NSLog(@"捕获动物数量为：%lu",(unsigned long)[captureAnimalSet count]);
        
        NSLog(@"前:");
        for (id object in animalArray) {
            NSLog(@"%@",[object name]);
        }
        //释放捕获动物
        for (NSNumber *index in captureAnimalSet) {
           [[animalArray objectAtIndex:([index integerValue])] release];
        }
        
   
        
     
    }
    return 0;
}
