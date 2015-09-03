//
//  GWSettingsTableViewController.m
//  Classmates
//
//  Created by Will Ge on 9/2/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWSettingsTableViewController.h"


@interface GWSettingsTableViewController ()

- (IBAction)addNRandomClassmates:(UIButton *)sender;

- (IBAction)updateAllClassmateRandomly:(id)sender;
- (IBAction)deleteAllClassmates:(id)sender;

@end

@implementation GWSettingsTableViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Testing buttons' methods

- (IBAction)addNRandomClassmates:(UIButton *)sender {
    
    // Get the number that how many classmates to create
    NSString *buttonText = sender.titleLabel.text;
    
    NSInteger number = 0;
    
    switch (buttonText.length) {
        case 26:
            number = 1;
            break;
        case 31:
            number = 1000;
            break;
        case 35:
            number = 1000000;
            break;
        case 39:
            number = 1000000000;
            break;
            
        default:
            break;
    }
    
    [GWClassmateDB addNRandomClassmates:number];
    
}

- (IBAction)updateAllClassmateRandomly:(id)sender {
    
    [GWClassmateDB updateAllClassmateRandomly];
    
}

- (IBAction)deleteAllClassmates:(id)sender {
    
    [GWClassmateDB deleteAllClassmates];
}




@end
