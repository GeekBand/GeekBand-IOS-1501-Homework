//
//  ViewController.h
//  HomeWork_ios开发
//
//  Created by john on 15/9/27.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController < UITableViewDelegate, UITableViewDataSource >

@property(strong,nonatomic)NSMutableArray *dialogMessages;


@end

