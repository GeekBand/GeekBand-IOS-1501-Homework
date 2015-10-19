//
//  test2ViewController.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/15.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "test2ViewController.h"
#import "LYTest2Request.h"
#import "LYTest2Request2.h"
@interface test2ViewController()<LYTest2RequestDelegate,LYTest2Request2Delegate>{
}

@end
@implementation test2ViewController

#pragma mark - Memory management methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - View's lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _JSONRequest = [[LYTest2Request alloc] init];
    [_JSONRequest sendLoginRequestWithDelegate:self];
    _XMLRequest = [[LYTest2Request2 alloc] init];
    [_XMLRequest sendLoginRequestWithDelegate:self];
    
    
    self.navigationController.title = @"JSON and XML";
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor clearColor];
    bgImageView.image = [UIImage imageNamed:@"bgTwo"];
    [self.view addSubview:bgImageView];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    CGFloat scrollViewWidth = width - 20;
    CGFloat scrollViewHeight = height - 300 - 49 - 37;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 80, scrollViewWidth, scrollViewHeight)];
    _scrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(scrollViewWidth , scrollViewHeight * 20);
    _scrollView.pagingEnabled = YES;
    _scrollView.maximumZoomScale = 3;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.delegate = self;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight * 20)];
    _contentView.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:_contentView];
    
    _scrollView2 = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 120 + scrollViewHeight, scrollViewWidth, scrollViewHeight)];
    _scrollView2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_scrollView2];
    _scrollView2.contentSize = CGSizeMake(scrollViewWidth , scrollViewHeight * 20);
    _scrollView2.pagingEnabled = YES;
    _scrollView2.maximumZoomScale = 3;
    _scrollView2.minimumZoomScale = 0.5;
    _scrollView2.delegate = self;
    
    _contentView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight * 20)];
    _contentView2.backgroundColor = [UIColor cyanColor];
    [_scrollView2 addSubview:_contentView2];
    
    _jasonLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, self.view.bounds.size.width -40, 2000)];
    _jasonLabel.textColor = [UIColor blackColor];
    _jasonLabel.backgroundColor = [UIColor clearColor];
    
    _jasonLabel.font = [UIFont systemFontOfSize:12];
    _jasonLabel.numberOfLines = 0;
    _jasonLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //_jasonLabel.text =(NSString *) _JSONRequest.receiveDic;
//    _jasonLabel.image = [UIImage imageWithContentsOfFile:aMessage.sender.headImagePath];
//    [self setMessage:aMessage.text];
    [_contentView addSubview:_jasonLabel];

    
    _xmlLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, self.view.bounds.size.width -40, 2000)];
    _xmlLabel.textColor = [UIColor blackColor];
    _xmlLabel.backgroundColor = [UIColor clearColor];
    
    _xmlLabel.font = [UIFont systemFontOfSize:12];
    _xmlLabel.numberOfLines = 0;
    _xmlLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //_jasonLabel.text =(NSString *) _JSONRequest.receiveDic;
    //    _jasonLabel.image = [UIImage imageWithContentsOfFile:aMessage.sender.headImagePath];
    //    [self setMessage:aMessage.text];
    [_contentView2 addSubview:_xmlLabel];
    
    
    

    
    
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

-(void)requestSuccess:(LYTest2Request *)request{
    _jasonLabel.text =[NSString stringWithFormat:@"JSON解析数据：\n%@",request.receiveDic];

}
-(void)requestSuccess2:(LYTest2Request2 *)request{
    _xmlLabel.text = [NSString stringWithFormat:@"XML解析 :\n%@", request.receivedData];
}

@end