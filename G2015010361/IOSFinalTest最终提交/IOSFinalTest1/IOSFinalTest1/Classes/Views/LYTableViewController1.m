//
//  LYTableViewController1.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTableViewController1.h"

@interface LYTableViewController1 ()

@end

@implementation LYTableViewController1

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
    
    self.title = @"sub view controller";
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 20, self.view.bounds.size.width , 40);
    [backButton setBackgroundColor:[UIColor redColor]];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor  blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self
                   action:@selector(backButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view. bounds.size.height;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, width, height)
                                              style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // _tableView.separatorColor = [UIColor blackColor];
    //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
//    headerView.backgroundColor = [UIColor orangeColor];
//    _tableView.tableHeaderView = headerView;
//    
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 100)];
//    footerView.backgroundColor = [UIColor purpleColor];
//    _tableView.tableFooterView = footerView;

}



#pragma mark - UITableViewDataSource And UITableViewDelegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}//一共有多少个section

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}//每个section有多少view

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 120;
}//每个section 每个row的高度


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}//每个section的header的高度

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
//    headerView.backgroundColor = [UIColor redColor];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
//    label.backgroundColor = [UIColor clearColor];
//    label.text = [NSString stringWithFormat:@"header: section = %li", section];
//    label.textColor = [UIColor whiteColor];
//    label.font = [UIFont systemFontOfSize:15];
//    [headerView addSubview:label];
    
   // return headerView;
    return nil;
}//在没个section的header里面添加view view里面加label

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 60)];
    footerView.backgroundColor = [UIColor blueColor];
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    //    NSString *cellIdentifier = [NSString stringWithFormat:@"%li%li", indexPath.section, indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
       // NSLog(@"创建一个cell... %@", cellIdentifier);
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //NSLog(@"refresh一个cell... ");//every row as a cell
    
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.textLabel.text = [NSString stringWithFormat:@"                 Section%li - Row%li", indexPath.section, indexPath.row];
    
    UIButton *headButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 35, 50, 50)];
    headButton.backgroundColor = [UIColor clearColor];
    [headButton addTarget:self
                        action:@selector(headButtonClicked:)
              forControlEvents:UIControlEventTouchUpInside];
    NSString *iconName = [NSString stringWithFormat:@"icon%li", indexPath.section + 1];
    UIImage *iconImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                                           pathForResource:iconName
                                                           ofType:@"png"]];
    [headButton setBackgroundImage:iconImage forState:UIControlStateNormal];
    [cell.contentView addSubview:headButton];

  
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//点的时候灰一下，如不写，一直灰
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:[NSString stringWithFormat:@"You Got Me \n [%li, %li]", indexPath.section, indexPath.row]
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
- (void)headButtonClicked:(UIButton *)cellButton {
   
}
@end
