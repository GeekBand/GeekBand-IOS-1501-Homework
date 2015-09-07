//
//  GWSongDB.m
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWSongDB.h"

@implementation GWSongDB

static GWSongDB *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];    
    });
    
    // Get realm and table instances for this thread
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    return SINGLETON;
}


#pragma mark - 


// Creating Objects
+ (void)createASongWith:(NSURL *)downloadurl {
    
    GWSong *song = [[GWClassmate alloc] init];
    
    // Set value
    song.uuid   = [[NSUUID UUID] UUIDString];

    
    // Add new instance to database
    [realm beginWriteTransaction];
    [realm addObject:song];
    [realm commitWriteTransaction];

}

// Nested Objects

// Adding Objects

// Updating Objects

// Deleting Objects

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[GWSongDB alloc] init];
}

- (id)mutableCopy
{
    return [[GWSongDB alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


@end
