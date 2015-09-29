//
//  ViewController.h
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/28.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController < UITableViewDataSource, UITableViewDelegate >

@property (nonatomic, strong) NSMutableArray * array;

@property (nonatomic, strong) NSMutableArray * cellArray;

@property (nonatomic, strong) NSMutableArray * imageArray;


@end

