//
//  GWSongDB.h
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Realm/Realm.h>

@interface GWSongDB : NSObject

/**
 * gets singleton object.
 * @return singleton
 */
+ (GWSongDB*)sharedInstance;



+ (void)createASongWith:(NSURL *)downloadurl ;


@end
