//
//  main.m
//  G2015010528_LWQHomework
//
//  Created by Andrew on 15/8/13.
//  Copyright (c) 2015年 andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WQAnimal.h"
#import "WQBird.h"
#import "WQFish.h"

int main()
{//问题3
    NSMutableArray *birdArray=[NSMutableArray array];
    NSMutableArray *fishArray=[NSMutableArray array];
    
    int arrayNum=10;
    
    for (int i=1; i<arrayNum; i++)
    {
        WQBird *bird=[[WQBird alloc]initWithName:[NSString stringWithFormat:@"Bird-%d", i] andWeight:5 andSex:LWQFemale];
        WQFish *fish=[[WQFish alloc]initWithName:[NSString stringWithFormat:@"Fish-%d", i] andWeight:10 andSex:LWQMale];
        [birdArray addObject:bird];
        [fishArray addObject:fish];
    }
    
    for (WQBird *wqBird in birdArray)
    {
        [wqBird sayBirdInfo];
    }
    
    for (WQFish *wqfish in fishArray)
    {
        [wqfish sayFishInfo];
    }

    
    //问题4
    int birdNum=0;
    for (int b=0; b<birdNum; b++)
    {
        NSUInteger randomNumOfBird = (NSUInteger)(arc4random() % (arrayNum-birdNum));
        
        if (b==randomNumOfBird)
        {
            birdNum++;
            [birdArray removeObjectAtIndex:b];
        }
        
        NSLog(@"%d只鸟被打中了",birdNum);
    }
    
    int fishNum =0;
    for (int f=0; f<fishNum; f++)
    {
        NSUInteger randomNumOfFish = (NSUInteger)(arc4random() % (arrayNum-fishNum));
        
        if (f==randomNumOfFish)
        {
            fishNum++;
            [fishArray removeObjectAtIndex:f];
        }
        
        NSLog(@"%i条鱼被捕获了",fishNum);
    }

    return 0;
}


