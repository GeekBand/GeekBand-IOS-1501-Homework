//
//  OCTFish.h
//  BLOCT
//
//  Created by Dige Qiao on 8/13/15.
//  Copyright (c) 2015 Dige Qiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCTAnimal.h"

@interface OCTFish : OCTAnimal

@property(nonatomic, strong)NSString *colorOfFish;

-(void) isAbleToSwim;
@end

