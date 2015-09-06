//
//  HJListViewController.h
//  HJClassmateList
//
//  Created by HeJay on 9/5/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJListViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addButtonClicked:(id)sender;


@end
