//
//  OCTMain.m
//  BLOCT
//
//  Created by Dige Qiao on 8/13/15.
//  Copyright (c) 2015 Dige Qiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCTAnimal.h"
#import "OCTBirds.h"
#import "OCTFish.h"





#pragma mark - 创建一个基于循环的数组
int main(int arg, const char * argv[])
{
    
    {
        NSMutableArray *animalArray = [[NSMutableArray alloc] init];
        
        int totalAmountOfGeneratingBirdOrFish = 10;
        
        for (int i=0; i<totalAmountOfGeneratingBirdOrFish; i++)
        {
            OCTBirds *bird = [[OCTBirds alloc]
            name:[NSString stringWithFormat:@"bird No.%d", i]
            weight:(float)i/10+2 gender:isFemale];
            bird.colorOfBird = @"white";
            
            OCTFish *fish = [[OCTFish alloc]
            name:[NSString stringWithFormat:@"fish No.%d", i]
            weight:(float)i/10+3 gender:isMale];
            fish.colorOfFish = @"red" ;
            
            [animalArray addObject:bird];
            [animalArray addObject:fish];
        }
#pragma mark - 遍历数组
        
        
        
        for (int i=0; i<[animalArray count]; i++)
        {
            id arrayItem = animalArray[i];
            if ([arrayItem isKindOfClass:[OCTBirds class]]) {
            
                OCTBirds *bird = arrayItem;
                NSLog(@"\nIt`s a bird named name: %@, weight: %.2fkg,  color: %@. ",
                      bird.name,
                      bird.weight,
                      bird.colorOfBird);
                     [bird isAbleToFly];
                
            }
            if ([arrayItem isKindOfClass:[OCTFish class]]) {
            
                OCTFish *fish = arrayItem;
                NSLog(@"\nIt`s a fish named name: %@, weight: %.2fkg,  color: %@. ",
                      fish.name,
                      fish.weight,
                      fish.colorOfFish);
                     [fish isAbleToSwim];
            
            }
        }
#pragma mark - 模拟捞鱼打鸟
        int birdCount = 0;
        int fishCount = 0;
        NSUInteger animalHuntedAmount = (NSUInteger)(arc4random() % 20);
        for (NSUInteger i = animalHuntedAmount; i > 0; i--) {
            
            id arrayItem = animalArray[i];
            if ([arrayItem isKindOfClass:[OCTBirds class]]) {
                birdCount ++;
                OCTBirds *bird = arrayItem;
                bird = nil;
                [animalArray removeObject:arrayItem];
            }
            
            if ([arrayItem isKindOfClass:[OCTFish class]]) {
                fishCount ++;
                OCTFish  *fish = arrayItem;
                fish = nil;
                [animalArray removeObject:arrayItem];
            }
   
        }
        
        NSLog(@"There are %d birds and %d fish hunted.", birdCount, fishCount);
    }
    return 0;
}
