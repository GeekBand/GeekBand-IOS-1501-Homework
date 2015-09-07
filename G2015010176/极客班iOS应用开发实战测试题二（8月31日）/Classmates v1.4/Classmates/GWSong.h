//
//  GWSong.h
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Realm/Realm.h>

@interface GWSong : RLMObject

@property NSString *uuid;
@property NSString *URL;
@property NSString *title;
@property NSString *album;
@property NSString *artist;
@property NSData   *artwotk;
@property NSData   *lyric;
@property NSData   *info;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<GWSong>
RLM_ARRAY_TYPE(GWSong)
