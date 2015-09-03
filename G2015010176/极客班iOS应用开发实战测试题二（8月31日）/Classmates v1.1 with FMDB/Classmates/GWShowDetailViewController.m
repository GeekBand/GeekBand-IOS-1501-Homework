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
@synthesize avatar;
@synthesize info;

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    

    GWClassmateDBManager *cdbm = [[GWClassmateDBManager alloc] init];
    
    // Query the classmate with UUID send by table view cell's segue
    GWClassmate *classmate = [cdbm getClassmateByUuid:uuid];

    // Set value of show items
    self.avatar.image = [UIImage imageWithData:classmate.avatar];
    self.name.text    = classmate.name;
    self.info.text    = classmate.info;

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
