//
//  Animal.h
//  CatchingFishesAndBirds
//
//  Created by Turtleeeeeeeeee on 15/8/9.
//  Copyright © 2015年 SCNU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    Male = 0,
    Female
}Gender;

@interface Animal : NSObject

@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)Gender gender;
@property(nonatomic, assign)CGFloat weight;

- (void)sayMyInfo;

@end
