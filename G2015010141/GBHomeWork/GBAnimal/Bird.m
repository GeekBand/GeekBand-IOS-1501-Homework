//
//  Bird.m
//  GBAnimal
//
//  Created by SeaHub on 15/8/9.
//  Copyright (c) 2015年 Geekband. All rights reserved.
//

#import "Bird.h"
#define NUMBEROFBIRD 10
#define NUMBEROFANNIMAL 20
@implementation Bird

-(void)birdFly{
    switch (self.sex) {
        case male:
            NSLog(@"My name is %@,weight is %.1f,I am Male. my color is %@.And now I am flying",self.name,self.weight,self.color);
            break;
        case female:
            NSLog(@"My name is %@,weight is %.1f,I am Female. my color is %@.And now I am flying",self.name,self.weight,self.color);
        default:
            break;
            
    }
}

-(instancetype)initBirdWithColor:(NSString *)aColor
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

-(void)birdArrestedSay{
    switch (self.sex) {
        case male:
            NSLog(@"Bird Arrested:My name is %@,weight is %.1f,I am Male.my color is %@.I was arrested",self.name,self.weight,self.color);
            break;
        case female:
            NSLog(@"Bird Arrested:My name is %@,weight is %.1f,I am Female.my color is %@.I was arrested",self.name,self.weight,self.color);
        default:
            break;
    }
}


+(void)birdArrested:(NSMutableArray *)animalArray{
    int n = (arc4random() % NUMBEROFBIRD) +1;
    int killedTotal = 0;
    for(int i = 0; i<n;i++) {
        int catchIndex = (arc4random() % NUMBEROFANNIMAL);
        if(catchIndex >= 0 && catchIndex < [animalArray count])
        {
            Bird *deleteTemp = animalArray[catchIndex];
            if (deleteTemp) {
                if ([deleteTemp isMemberOfClass:[Bird class]]) {
                    [animalArray removeObjectAtIndex:catchIndex];
                    [deleteTemp birdArrestedSay];
                    ++ killedTotal;
                }
            }
            
        }
        
    }
    NSLog(@"Totally killed %i birds",killedTotal);
}

+(void)createBird:(NSMutableArray *)aliveArray{
    for (int i=0,j=10; i<5; i++) {
        CGFloat birdWeight = i+0.2;

        NSString *tempBirdName = [[NSString alloc]initWithFormat:@"Female Bird %i",++j];
        Bird *tempBird = [[Bird alloc]initBirdWithColor:@"White"
                                                   Name:tempBirdName
                                                 Sexual:female
                                                 Weight:birdWeight];
        NSString *tempBirdName2 = [[NSString alloc]initWithFormat:@"Male Bird %i",++j];
        Bird *tempBird2 = [[Bird alloc]initBirdWithColor:@"Black"
                                                    Name:tempBirdName2
                                                  Sexual:male
                                                  Weight:birdWeight];
        [aliveArray addObject:tempBird];
        [aliveArray addObject:tempBird2];
    }

}


@end
