//
//  test3ViewController.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTest3Message.h"
#import "LYTest3CustomCell.h"
#import "test3AddContentViewController.h"
@interface test3ViewController : UIViewController< UITableViewDelegate,
UITableViewDataSource, LYTest3CustomCellDelegate,test3AddContentViewControllerDelegate> {
    UITableView         *_tableView;
    NSMutableArray      *_messageArray;
    
}

- (void)createMessageData;


@end
