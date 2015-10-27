//
//  GBMViewDetailViewController.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMViewDetailViewController.h"
#import "GBMGlobal.h"
#import "GBMViewDetailRequest.h"
#import "GBMCommentListCell.h"
#import "GBMUserModel.h"
#import "GBMViewDetailModel.h"

@interface GBMViewDetailViewController ()<GBMViewDetailRequestDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIActivityIndicatorView *activity;
    UITableView     *_tableView;
    
}


@end

@implementation GBMViewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    CGFloat width =self.view.frame.size.width/2;
    [activity setCenter:CGPointMake(width , 160) ];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activity];
    [activity startAnimating];
    self.photoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.pic_url]]];
    [activity stopAnimating];
    
    NSString *token= [GBMGlobal shareGlobal].user.token;
    NSString *userId= [GBMGlobal shareGlobal].user.userId;
    NSDictionary *dic = @{@"user_id":userId, @"token":token, @"pic_id":self.pic_id};
    GBMViewDetailRequest *request= [[GBMViewDetailRequest alloc]init];
    [request sendViewDetailRequestWithParameter:dic delegate:self];
    
    
}
-(UIImage *) getImageFromURL:(NSString *)fileURL {
    
    NSLog(@"执行图片下载函数");
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDetailRequestSuccess:(GBMViewDetailRequest *)request data:(NSArray *)array
{
    self.commentArr = array;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.photoImage.frame.size.height+self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)viewDetailRequestFailed:(GBMViewDetailRequest *)request error:(NSError *)error{
    [activity stopAnimating];
}
#pragma mark - UITableViewDelegate and UITableViewDataSource methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentArr.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellIdentifier";
    GBMCommentListCell *cell = (GBMCommentListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[GBMCommentListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    
    GBMViewDetailModel *model = self.commentArr[indexPath.row];
    cell.textOfComment.text = model.comment;
    cell.dateOfComment.text = model.modified;
    return cell;
}


@end
