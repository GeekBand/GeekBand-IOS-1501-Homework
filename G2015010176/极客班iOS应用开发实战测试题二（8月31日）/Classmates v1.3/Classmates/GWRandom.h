//
//  GWRandom.h
//  Classmates
//
//  Created by Will Ge on 9/2/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWRandom : NSObject

/**
 *  Create a random name
 *
 *  @return the random name
 */
+ (NSString *)createARandomName;

/**
 *  Create a random text
 *
 *  @return the random text
 */
+ (NSString *)createARandomText;

@end
