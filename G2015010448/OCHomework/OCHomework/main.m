//
//  main.m
//  OCHomework
//
//  Created by RayBoon on 2015/08/22.
//  Copyright (c) 2015年 RayBoon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Animal.h"
#import "Bird.h"
#import "Fish.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray * mArray = [NSMutableArray array];
        
        for (int i =1; i <= 10; i++) {
            NSString * name = [NSString stringWithFormat:@"bird%d",i];
            Bird * bird = [[Bird alloc] initWithName: name WithWeight:1.0f WithGender:female WithColor:@"white"];
            name = [NSString stringWithFormat:@"fish%d",i];
            Fish * fish = [[Fish alloc] initWithName:name WithWeight:0.5f WithGender:male WithColor:@"grey"];
            [mArray addObject:bird];
            [mArray addObject:fish];
        }
        
        for (int j = 0; j < [mArray count]; j++) {
            id object = [mArray objectAtIndex:j];
            if ([[object class] isSubclassOfClass: [Bird class]]) {
                [object fly];
            }else{
                [object swimming];
            }
        }
        
        NSInteger total = arc4random() % 20 ;
        NSInteger birdNum = 0;
        NSInteger fishNum = 0;
        for (int k = 0; k < total; k++) {
            NSInteger index = arc4random() % [mArray count];
            id object = [mArray objectAtIndex:index];
            if ([[object class] isSubclassOfClass: [Bird class]]) {
                birdNum++;
            }else{
                fishNum++;
            }
            [mArray removeObject:object];
            object = nil;
        }
        NSLog(@"打到了%d只鸟，捕到了%d条鱼", birdNum, fishNum);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
