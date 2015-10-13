
//
//  LYTableViewController2.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTableViewController2.h"

@interface LYTableViewController2 ()

@end

@implementation LYTableViewController2

#pragma mark - Memory management methods

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (self.view.window == nil) {
        
    }
}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _cellName = [NSMutableArray array];
    [_cellName addObject:@"飞行模式"];
    [_cellName addObject:@"WI-FI"];
    [_cellName addObject:@"蜂窝移动网络"];
    [_cellName addObject:@"个人热点"];
    [_cellName addObject:@"VPN"];
    [_cellName addObject:@"蓝牙"];
    [_cellName addObject:@"运营商"];
    [_cellName addObject:@"通知"];
    [_cellName addObject:@"控制中心"];
    [_cellName addObject:@"勿扰模式"];
    [_cellName addObject:@"通用"];
    [_cellName addObject:@"亮度与显示"];
    
    
    self.title = @"sub view controller";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 20, self.view.bounds.size.width , 40);
    [backButton setBackgroundColor:[UIColor whiteColor]];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self
                   action:@selector(backButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view. bounds.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, width, height)
                                              style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // _tableView.separatorColor = [UIColor blackColor];
    //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 10)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    _tableView.tableHeaderView = headerView;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 30)];
    footerView.backgroundColor = [UIColor lightGrayColor];
    _tableView.tableFooterView = footerView;
    
}



#pragma mark - UITableViewDataSource And UITableViewDelegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}//一共有多少个section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 7;
    }else if(section == 1) {
        return 3;
    }else {
        return 2;
    }
    
}//每个section有多少view

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}//每个section 每个row的高度


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}//每个section的header的高度

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    headerView.backgroundColor = [UIColor lightGrayColor];

    
    return headerView;
}//在没个section的header里面添加view view里面加label


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int rowTag;
    if (indexPath.section == 0) {
        rowTag = 0;
    }else if(indexPath.section == 1) {
        rowTag = 7;
    }else {
        rowTag = 10;
    }
    long  row = rowTag + indexPath.row;
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    NSString *cellName1 = [_cellName objectAtIndex:row];
    cell.textLabel.text = cellName1;

    
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
  
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//点的时候灰一下，如不写，一直灰
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"section = %li, row = %li", indexPath.section, indexPath.row]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Custom event methods

- (void)backButtonClicked:(id)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
        //    [self.navigationController popToRootViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
