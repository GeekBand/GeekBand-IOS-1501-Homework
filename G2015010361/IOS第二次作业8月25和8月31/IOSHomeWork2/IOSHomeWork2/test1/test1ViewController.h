//
//  test1ViewController.h
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYTest1Message.h"
#import "LYTest1Button1.h"
#import "LYTest1CustomCell1.h"
#import "LYTest1User.h"
@interface test1ViewController : UIViewController< UITableViewDelegate,
UITableViewDataSource, LYTest1CustomCell1Delegate> {
    UITableView         *_tableView;
    NSMutableArray      *_messageArray;
    
}

@property(nonatomic, strong)UIImageView *bgImageView;

- (void)createMessageData;

@end


