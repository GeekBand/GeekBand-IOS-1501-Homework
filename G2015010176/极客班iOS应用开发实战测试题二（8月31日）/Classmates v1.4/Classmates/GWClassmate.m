//
//  GWClassmate.m
//  同学录
//
//  Created by Will Ge on 8/30/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWClassmate.h"

@implementation GWClassmate

// Set primary key
+ (NSString *)primaryKey {
    return @"uuid";
}

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"avatar" : UIImagePNGRepresentation([UIImage imageNamed:@"deault_avatar"]), @"info" : @"Info not set", @"name" : @" ", @"uuid" : [[NSUUID UUID] UUIDString]};
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
