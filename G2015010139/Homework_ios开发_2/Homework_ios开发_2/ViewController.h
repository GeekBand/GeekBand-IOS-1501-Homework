//
//  ViewController.h
//  Homework_ios开发_2
//
//  Created by john on 15/9/29.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController < UITableViewDelegate, UITableViewDataSource >

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, assign) BOOL isChanged;

- (void)reload;

@end

