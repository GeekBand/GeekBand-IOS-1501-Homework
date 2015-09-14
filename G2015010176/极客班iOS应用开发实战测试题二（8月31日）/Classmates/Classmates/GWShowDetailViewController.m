//
//  GWShowDetailViewController.m
//  同学录
//
//  Created by Will Ge on 8/30/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWShowDetailViewController.h"

@interface GWShowDetailViewController ()


@end

@implementation GWShowDetailViewController

@synthesize uuid;
@synthesize name;
@synthesize avator;
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
        self.avator.image = [UIImage imageWithData:classmate.avator];
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



@end
