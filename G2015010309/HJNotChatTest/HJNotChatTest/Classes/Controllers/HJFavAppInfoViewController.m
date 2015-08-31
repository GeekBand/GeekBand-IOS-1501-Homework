//
//  HJFavAppInfoViewController.m
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJFavAppInfoViewController.h"
#import "HJFavPaidAppRequest.h"
#import "HJAppInfoCell.h"
#import "HJAppInfo.h"
#import "HJAppImage.h"
#import "HJAppDetailViewController.h"

@interface HJFavAppInfoViewController () <HJFavPaidAppRequestDelegate>{
    NSMutableArray  *_appArray;
    double          _latestJsonParseTime;
    double          _latestXMLParseTime;
}

@end

@implementation HJFavAppInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.FavAppTableView setHidden:YES];
    self.navigationItem.title = @"Top 10 Paid Apps";
    
    _hintLabel.text = @"Click XML or JSON button \nto request data.";
    
    //json button
    UIBarButtonItem *jsonRequestButton = [[UIBarButtonItem alloc]initWithTitle:@"JSON"
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(jsonRequestButtonClicked:)];
    self.navigationItem.rightBarButtonItem = jsonRequestButton;
    
    //xml button
    UIBarButtonItem *xmlRequestButton = [[UIBarButtonItem alloc]initWithTitle:@"XML"
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(xmlRequestButtonClicked:)];
    self.navigationItem.leftBarButtonItem = xmlRequestButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Tableview delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *appCellIdentifier = @"appCellIdentifier";
    HJAppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:appCellIdentifier];
    if (cell == nil) {
        cell = [[HJAppInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:appCellIdentifier];
    }

    HJAppInfo *appInfo = [_appArray objectAtIndex:indexPath.row];
    [cell setAppName:appInfo.appName];
    HJAppImage *appImg = [appInfo.imageArray objectAtIndex:[appInfo.imageArray count]-1];
    [cell setAppImage: appImg.imageUrl];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_appArray count] > indexPath.row) {
        HJAppInfo *appInfo = [_appArray objectAtIndex:indexPath.row];
        HJAppDetailViewController *detailViewController
        = [[HJAppDetailViewController alloc] init];
        detailViewController.appInfo = appInfo;
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HJAppInfo *appInfo = [_appArray objectAtIndex:indexPath.row];
    NSString *appName = appInfo.appName;
    return [HJAppInfoCell calculateCellHeightWithText:appName];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"count: %li", [_appArray count]);
    return [_appArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return [NSString stringWithFormat:@"latest parse time: %f", _latestParseTime];
//}


#pragma mark  - HJFavPaidAppRequestDelegate

- (void)requestSuccess:(NSMutableArray *)appArray {
    _appArray = appArray;
    NSLog(@"number: %li", [_appArray count]);
    [self reloadTable];
    [self.activityView stopAnimating];
    [self.FavAppTableView setHidden:NO];
    [self addFooterView];
}

- (void)setJsonParseTime:(double)time {
    _latestJsonParseTime = time;
}

- (void)setXmlParseTime:(double)time {
    _latestXMLParseTime = time;
}

#pragma mark - Custom methods

- (void)jsonRequestButtonClicked:(id)sender {
    [_hintLabel removeFromSuperview];
    [_activityView startAnimating];
    HJFavPaidAppRequest *request = [[HJFavPaidAppRequest alloc] init];
    request.delegate = self;
    request.isJson = YES;
    [request requestForPaidAppJson: YES];
}

- (void)xmlRequestButtonClicked: (id)sender {
    [_hintLabel removeFromSuperview];
    [_activityView startAnimating];
    HJFavPaidAppRequest *request = [[HJFavPaidAppRequest alloc] init];
    request.delegate = self;
    request.isJson = NO;
    [request requestForPaidAppJson: NO];
}

- (void)reloadTable{
    [_FavAppTableView reloadData];
}

//- (void)loadAppData {
//    HJFavPaidAppRequest *request = [[HJFavPaidAppRequest alloc] init];
//    request.delegate = self;
//    [request requestForPaidApp];
//}

- (void)addFooterView {
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.text = [NSString stringWithFormat:@"  Latest json parse time: %f\n  Latest xml parse time: %f",
                        _latestJsonParseTime, _latestXMLParseTime];
    headerLabel.textColor = [UIColor purpleColor];
    headerLabel.font = [UIFont systemFontOfSize:16];
    headerLabel.textAlignment = NSTextAlignmentLeft;
    headerLabel.backgroundColor = [UIColor cyanColor];
    headerLabel.numberOfLines = 0;
    headerLabel.frame = CGRectMake(0, 0, self.view.bounds.size.width, 60);
    _FavAppTableView.tableHeaderView = headerLabel;
}

@end
