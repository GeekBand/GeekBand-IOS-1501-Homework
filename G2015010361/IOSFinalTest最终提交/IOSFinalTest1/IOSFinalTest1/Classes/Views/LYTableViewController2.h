//
//  LYTableViewController2.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTableViewController2 : UIViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    UITableView     *_tableView;
    NSMutableArray  *_cellName;
}


@end
