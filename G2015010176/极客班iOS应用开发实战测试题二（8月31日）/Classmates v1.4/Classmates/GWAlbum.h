//
//  GWAlbum.h
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Realm/Realm.h>

@interface GWAlbum : RLMObject

@end

// This protocol enables typed collections. i.e.:
// RLMArray<GWAlbum>
RLM_ARRAY_TYPE(GWAlbum)
