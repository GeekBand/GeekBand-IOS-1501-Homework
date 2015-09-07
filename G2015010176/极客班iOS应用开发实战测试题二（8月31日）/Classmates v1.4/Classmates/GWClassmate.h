//
//  GWClassmate.h
//  同学录
//
//  Created by Will Ge on 8/30/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>

@interface GWClassmate : RLMObject

@property NSString *uuid;
@property NSData   *avatar;
@property NSString *name;
@property NSString *info;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<GWClassmate>
RLM_ARRAY_TYPE(GWClassmate)
