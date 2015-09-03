//
//  GWClassmateDB.h
//  Classmates
//
//  Created by Will Ge on 9/2/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GWClassmate.h"
#import <Realm/Realm.h>
#import "GWRandom.h"

@interface GWClassmateDB : NSObject

/**
 *  Create a appointed number of classmates
 *
 *  @param number  the appointed number
 */
+ (void)addNRandomClassmates:(NSInteger)number;

/**
 *  Update all classmate randomly
 */
+ (void)updateAllClassmateRandomly;

/**
 *  Delete all classmates
 */
+ (void)deleteAllClassmates;

@end
