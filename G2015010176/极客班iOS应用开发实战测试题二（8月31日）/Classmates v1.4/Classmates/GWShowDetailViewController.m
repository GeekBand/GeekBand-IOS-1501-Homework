//
//  GWShowDetailViewController.m
//  同学录
//
//  Created by Will Ge on 8/30/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWShowDetailViewController.h"

@interface GWShowDetailViewController ()

- (IBAction)saveChanges:(id)sender;
- (IBAction)deleteClassmate:(id)sender;


@end

@implementation GWShowDetailViewController

@synthesize uuid;
@synthesize name;
@synthesize avatar;
@synthesize info;

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Query examples
    // Query using a predicate string
//    RLMResults *tanDogs = [Dog objectsWhere:@"color = 'tan' AND name BEGINSWITH 'B'"];
    
    // Query using an NSPredicate
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"color = %@ AND name BEGINSWITH %@", @"tan", @"B"];
//    tanDogs = [Dog objectsWithPredicate:pred];
    
    // Query the classmate with UUID send by table view cell's segue
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"uuid = %@", self.uuid];
    RLMResults *results = [GWClassmate objectsWithPredicate:pred];
    
    
    if (results.count > 0) {
        GWClassmate *classmate = results[0];
        
        // Set value of show items
        self.avatar.image = [UIImage imageWithData:classmate.avatar];
        self.name.text    = classmate.name;
        self.info.text    = classmate.info;
    }

    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}


#pragma mark - Delete and Update classmate methods

- (IBAction)deleteClassmate:(id)sender {
    
    // Query the classmate with UUID
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"uuid = %@", self.uuid];
    RLMResults *results = [GWClassmate objectsWithPredicate:pred];
    
    GWClassmate *classmate = results[0];
    
    // Get the default database
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // Delete object from database
    [realm beginWriteTransaction];
    [realm deleteObject:classmate];
    [realm commitWriteTransaction];
}

- (IBAction)saveChanges:(id)sender {
    
    // Query the classmate with UUID
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"uuid = %@", self.uuid];
    RLMResults *results = [GWClassmate objectsWithPredicate:pred];
    
    GWClassmate *classmate = results[0];
    
    // Get the default database
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // Update value
    // Transaction to database
    [realm beginWriteTransaction];
    classmate.avatar = UIImagePNGRepresentation(self.avatar.image);
    classmate.name   = self.name.text;
    classmate.info   = self.info.text;
    [realm commitWriteTransaction];

}


@end
