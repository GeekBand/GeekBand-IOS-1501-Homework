//
//  ViewController3.m
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/26.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "ViewController3.h"
#import "CMJGlobal.h"
#import "Cell3.h"

@interface ViewController3 ()

@property(nonatomic,strong)CMJUser *user;
@property(nonatomic,strong)CMJRequest *request;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CMJGlobal *global = [CMJGlobal shareGloabl];
    self.user = global.user;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    self.view.backgroundColor = [[UIColor alloc]initWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    self.view.backgroundColor = [[UIColor alloc]initWithRed:57/255.0 green:164/255.0 blue:249/255.0 alpha:1];
    self.title = @"作业二";
    
    
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    Cell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[Cell3 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell3"];
    }
    cell.backgroundColor = [[UIColor alloc]initWithRed:212/255.0 green:234/255.0 blue:164/255.0 alpha:1];
    cell.Label1.text = self.user.imName.label[indexPath.row];
    cell.Word.text = self.user.summary.label[indexPath.row];
    cell.Label2.text = self.user.imPrice.label[indexPath.row];
    return cell;


}




@end
