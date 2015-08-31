//
//  Fish.m
//  GBAnimal
//
//  Created by SeaHub on 15/8/9.
//  Copyright (c) 2015年 Geekband. All rights reserved.
//

#import "Fish.h"
#define NUMBEROFFISH 10
#define NUMBEROFANNIMAL 20
@implementation Fish

-(void)fishSwim{
    switch (self.sex) {
        case male:
            NSLog(@"Fish Swim:My name is %@,weight is %.1f,I am Male. my color is %@.And now I am swimming",self.name,self.weight,self.color);
            break;
        case female:
            NSLog(@"Fish Swim:My name is %@,weight is %.1f,I am Female. my color is %@.And now I am swimming",self.name,self.weight,self.color);
        default:
            break;
    }
}

-(void)fishArrestedSay{
    switch (self.sex) {
        case male:
            NSLog(@"Fish Arrested:My name is %@,weight is %.1f,I am Male. my color is %@.And now I am swimming",self.name,self.weight,self.color);
            break;
        case female:
            NSLog(@"Fish Arrested:My name is %@,weight is %.1f,I am Female. my color is %@.And now I am swimming",self.name,self.weight,self.color);
        default:
            break;
    }
}

-(instancetype)initFishWithColor:(NSString *)aColor
                            Name:(NSString *)aName
                          Sexual:(sexual)aSex
                          Weight:(CGFloat)aWeight{
    self = [super init];
    if (self) {
        self.name = aName;
        self.color = aColor;
        self.sex = aSex;
        self.weight = aWeight;
    }
    
    return self;
}

+(void)fishArrested:(NSMutableArray *)animalArray{
    int n = (arc4random() % NUMBEROFFISH )+1;
    int killedTotal = 0;
    for(int i = 0; i<n;i++) {
        int catchIndex = (arc4random() % NUMBEROFANNIMAL);
        if(catchIndex >= 0 && catchIndex < [animalArray count])
        {
            Fish *deleteTemp = animalArray[catchIndex];
            if (deleteTemp) {
                if ([deleteTemp isMemberOfClass:[Fish class]]) {
                    [animalArray removeObjectAtIndex:catchIndex];
                    [deleteTemp fishArrestedSay];
                    ++ killedTotal;
                }
            }
           
        }

    }
    NSLog(@"Totally killed %i fishes",killedTotal);
}

+(void)createFish:(NSMutableArray *)aliveArray{
    for (int i=0,j=0; i<5; i++) {
        CGFloat fishWeight = 0.2 * (i+0.5);
        NSString *tempFishName = [[NSString alloc]initWithFormat:@"Female Fish %i",++j];
        Fish *tempFish = [[Fish alloc]initFishWithColor:@"Blue"
                                                   Name:tempFishName
                                                 Sexual:female
                                                 Weight:fishWeight];
        NSString *tempFishName2 = [[NSString alloc]initWithFormat:@"Male Fish %i",++j];
        Fish *tempFish2 = [[Fish alloc]initFishWithColor:@"Yellow"
                                                    Name:tempFishName2
                                                  Sexual:male
                                                  Weight:fishWeight];


        [aliveArray addObject:tempFish];
        [aliveArray addObject:tempFish2];

    }

}
@end
