//
//  ZZHAnimal.h
//  ZZHOCHomeWork
//
//  Created by 张志华 on 15/8/15.
//  Copyright (c) 2015年 张志华. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZZHAnimalGender){
    ZZHAnimalMale ,
    ZZHAnimalFemale
};

@interface ZZHAnimal : NSObject

@property (strong , nonatomic) NSString *name;
@property (assign , nonatomic) ZZHAnimalGender genger;
@property (assign , nonatomic) float weight;

- (void)bleat;

@end
