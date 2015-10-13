//
//  HJClassmateDB.h
//  HJClassmateList
//
//  Created by HeJay on 9/5/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "HJClassmate.h"

@interface HJClassmateDB : NSObject {
    FMDatabase *_db;
}

- (BOOL) createClassmateTable;
- (BOOL) addClassmate: (HJClassmate *)classmate;
- (NSMutableArray *) getAllClassmates;
- (BOOL) deleteClassmateWithName: (NSString *)aName;
- (BOOL)tableExists;

@end
