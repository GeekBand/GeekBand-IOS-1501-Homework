//
//  GWClassmateDB.m
//  Classmates
//
//  Created by Will Ge on 9/2/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWClassmateDB.h"

@implementation GWClassmateDB


+ (void)addNRandomClassmates:(NSInteger)number {
    
    // Add queue
    dispatch_queue_t addQueue = dispatch_queue_create("addQueue", NULL);
    dispatch_async(addQueue, ^{
        
        // Get realm and table instances for this thread
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        
        // by starting a new transaction
        for (NSInteger idx1 = 0; idx1 < number; idx1++) {
            [realm beginWriteTransaction];
            
            // Add 1000 classmates
            for (NSInteger idx2 = 0; idx2 < 1000; idx2++) {
                
                // Create a new GWClassmate instance
                GWClassmate *newClassmate = [[GWClassmate alloc] init];
                
                // Set value
                // Use the GWRandom.h utility to create random name and text
                newClassmate.uuid   = [[NSUUID UUID] UUIDString];
                newClassmate.avatar = UIImagePNGRepresentation([UIImage imageNamed:@"contacts"]);
                newClassmate.name   = [GWRandom createARandomName];
                newClassmate.info   = [GWRandom createARandomText];
                
                
                [realm addObject:newClassmate];
                
            }
            
            // Commit the write transaction
            // to make this data available to other threads
            [realm commitWriteTransaction];
        }
        
    });
    
    
}

+ (void)updateAllClassmateRandomly{
    
    
    // Update queue
    dispatch_queue_t updateQueue = dispatch_queue_create("updateQueue", NULL);
    dispatch_async(updateQueue, ^{
        
        
        // Get realm and table instances for this thread
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        // Get the total number of classmates
        RLMResults *results              = [GWClassmate allObjects];
        unsigned long number             = results.count;
        unsigned int divisionByThousand  = number / 1000;
        unsigned int remainderByThousand = number % 1000;
        
        
        // By starting a new transaction
        
        // Part 1 - divisionByThousand * 1000
        for (NSInteger idx1 = 0; idx1 < divisionByThousand; idx1++) {
            
            [realm beginWriteTransaction];
            
            // Update 1000 classmates
            for (NSInteger idx2 = 0; idx2 < 1000; idx2++) {
                
                // Create a new GWClassmate instance
                GWClassmate *newClassmate = results[idx1 * 1000 + idx2];
                
                // Keep name
                NSString *name = newClassmate.name;
                newClassmate.name = name;
                
                // Change avatar and info
                newClassmate.avatar = UIImagePNGRepresentation([UIImage imageNamed:@"contacts_selected"]);
                newClassmate.info   = @"Testing update : divisionByThousand * 100";
                
                // Updating Objects with primary keys
                // This will make properties no settled be NULL
                [GWClassmate createOrUpdateInDefaultRealmWithValue:newClassmate];
                
            }
            
            // Commit the write transaction
            // to make this data available to other threads
            [realm commitWriteTransaction];
        }
        
        
        // Part 2 - remainderByThousand
        [realm beginWriteTransaction];
        
        for (NSInteger idx1 = 0; idx1 < remainderByThousand; idx1++) {
            
            
            // Create a new GWClassmate instance
            GWClassmate *newClassmate = results[divisionByThousand * 1000 + idx1];
            
            // Change avatar and info
            newClassmate.avatar = UIImagePNGRepresentation([UIImage imageNamed:@"contacts"]);
            newClassmate.info   = @"Testing update : remainderByThousand";
            
            
        }
        
        [realm commitWriteTransaction];
        
        
    });
    
}

+ (void)deleteAllClassmates {
    
    // Get realm and table instances for this thread
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // Delete all objects from the realm
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];
}

@end
