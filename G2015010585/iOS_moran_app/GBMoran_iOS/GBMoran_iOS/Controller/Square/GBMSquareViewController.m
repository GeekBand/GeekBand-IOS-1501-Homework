//
//  GBMSquareViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMSquareViewController.h"
#import "GBMSquareCell.h"
#import "KxMenu.h"
#define SPAN  MACoordinateSpanMake(0.025, 0.025)
#import "MJRefresh.h"
#import "GBMSquareRequest.h"
#import "GBMUserModel.h"
#import "GBMGlobal.h"

#import "GBMPictureModel.h"
#import "GBMSquareModel.h"
#import "GBMViewDetailViewController.h"
#import "UIImageView+WebCache.h"
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]
@interface GBMSquareViewController ()<UITableViewDelegate, UITableViewDataSource, GBMSquareRequestDelegate,CLLocationManagerDelegate>
@property (nonatomic, strong) NSArray *scrollArray;
@property (nonatomic ,strong) NSMutableDictionary * userLocationDict;

@property (strong, nonatomic) NSMutableArray *data; // Temp Refresh

@property (nonatomic, strong) NSDictionary *dataDic;
@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) UIButton *titleButton;



@property (nonatomic, strong) NSMutableArray *addrArray;
@property (nonatomic, strong) NSMutableArray *pictureArray;

@property(nonatomic , strong) CLLocationManager *locationManager;


@end

@implementation GBMSquareViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.locationDic = [NSMutableDictionary dictionary];
    
    
    
    //NavigationBar的设置
    self.titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.titleButton setTitle:@"全部" forState:UIControlStateNormal];
    self.titleButton.frame = CGRectMake(0, 0, 200, 35);
//    [self.titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.titleButton setImage:[UIImage imageNamed:@"icon_arrow_down"] forState:UIControlStateNormal];
    self.titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 133, 0, 0);
    self.titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    
    self.navigationItem.titleView = self.titleButton;
    
    [self requestAllData];
    //头刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
            
        });
    }];
    
    self.tableView.header.automaticallyChangeAlpha = YES;
    //尾刷新
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.footer endRefreshing];
        });
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}




// 载入网络刷新数据
-(void) loadUpPullData {
    for (int i; i < 5; i ++) {
        [self.data insertObject:MJRandomData atIndex:0];
    }
    
}


-(void) upPullRefresh {
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadUpPullData];
    }];
    
    [self.tableView.header beginRefreshing];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numberOfSectionsInTabelView: %zd", self.addrArray.count);
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"addrArray: %zd", self.addrArray.count);
    return self.addrArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    static NSString *str = @"squareCell";
    GBMSquareCell * cell = [tableView dequeueReusableCellWithIdentifier:@"squareCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[GBMSquareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"squareCell"];
    }
    
    GBMSquareModel *squareModel = self.addrArray[indexPath.row][0];
    cell.squareVC = self;
//    NSLog(@"%zd", indexPath.section);
    cell.locationLabel.text = squareModel.addr;
    cell.dataArr = self.dataDic[self.addrArray[indexPath.row]];
    [cell.collectionView reloadData];
    return cell;
}


- (void)requestAllData
{
    NSDictionary *paramDic = @{@"user_id":[GBMGlobal shareGlobal].user.userId, @"token":[GBMGlobal shareGlobal].user.token, @"longitude":@"121.47794", @"latitude":@"31.22516", @"distance":@"1000"};
    
    GBMSquareRequest *squareRequest = [[GBMSquareRequest alloc] init];
    [squareRequest sendSquareRequestWithParameter:paramDic delegate:self];
}

- (void)squareRequestSuccess:(GBMSquareRequest *)request dictionary:(NSDictionary *)dictionary
{
    //    NSLog(@"%@", dictionary);
    self.addrArray = [NSMutableArray arrayWithArray:[dictionary allKeys]];
    self.pictureArray = [NSMutableArray arrayWithArray:dictionary[@"pic"]];
    self.dataDic = dictionary;
    [self.tableView reloadData];
    
}
- (void)squareRequestFailed:(GBMSquareRequest *)request error:(NSError *)error
{
    
}

#pragma mark - toCheckPicture
- (void)toCheckPicture
{
    GBMViewDetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"GBMViewDetail" bundle:nil] instantiateViewControllerWithIdentifier:@"detailVC"];
    [detailVC.photoImage sd_setImageWithURL:[NSURL URLWithString:_pic_url]];
    detailVC.pic_id=_pic_id;
    detailVC.pic_url =_pic_url;
    [self.navigationController pushViewController:detailVC animated:YES];
}










@end