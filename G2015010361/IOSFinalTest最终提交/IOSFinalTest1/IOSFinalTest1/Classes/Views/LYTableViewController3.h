//
//  LYTableViewController3.h
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCreateCatMouseData.h"
@interface LYTableViewController3 : UIViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    UITableView     *_tableView;
    NSMutableArray  *_CarAndMouse;
    LYCreateCatMouseData *_aCatAndMouseData;
    NSMutableArray      *_messageArray;
    NSMutableArray      *_messageArray2;
}


@end
