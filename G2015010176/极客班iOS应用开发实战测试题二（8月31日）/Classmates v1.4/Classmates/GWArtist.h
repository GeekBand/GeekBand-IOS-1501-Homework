//
//  GWArtist.h
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Realm/Realm.h>

@interface GWArtist : RLMObject

@end

// This protocol enables typed collections. i.e.:
// RLMArray<GWArtist>
RLM_ARRAY_TYPE(GWArtist)
