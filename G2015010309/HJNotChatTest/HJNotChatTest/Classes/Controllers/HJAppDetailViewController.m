//
//  HJAppDetailViewController.m
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJAppDetailViewController.h"
#import "HJAppImage.h"

@interface HJAppDetailViewController ()

@end

@implementation HJAppDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = self.appInfo.appName;
    
    CGFloat imageWidth = 100;
    CGFloat imageHeight = 100;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, imageWidth, imageHeight)];
    
    [self.view addSubview:imageView];
    HJAppImage *appImg = [self.appInfo.imageArray objectAtIndex:[self.appInfo.imageArray count]-1];
    NSURL *url = [NSURL URLWithString:[appImg.imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:url];
    imageView.image = [UIImage imageWithData:imageData];
    
    //releasedate label
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 85, [UIScreen mainScreen].bounds.size.width - 120 - 20, 60)];
    [self.view addSubview:dateLabel];
    dateLabel.font = [UIFont systemFontOfSize:13];
    dateLabel.textColor = [UIColor grayColor];
    dateLabel.numberOfLines = 0;
    dateLabel.text = [NSString stringWithFormat:@"Release Date:\n    %@", _appInfo.releaseDate];
    
    //artist label
    UILabel *artistLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 120, [UIScreen mainScreen].bounds.size.width - 120 - 20, 60)];
    artistLabel.font = [UIFont systemFontOfSize:13];
    artistLabel.textColor = [UIColor grayColor];
    artistLabel.numberOfLines = 0;
    artistLabel.text = [NSString stringWithFormat:@"Artist:\n    %@", _appInfo.artist];
    [self.view addSubview:artistLabel];
    
    
    //Summary
    UITextView *summaryView = [[UITextView alloc] init];
    summaryView.text = _appInfo.summary;
    summaryView.delegate = self;
    summaryView.font = [UIFont systemFontOfSize:15];
    CGFloat summaryWidth = [[UIScreen mainScreen] bounds].size.width - 40;
    CGSize summarySize = [_appInfo.summary boundingRectWithSize:CGSizeMake(summaryWidth, CGFLOAT_MAX)
                                                        options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                                        context:nil].size;
    summaryView.frame = CGRectMake(20, imageView.frame.origin.y + imageHeight + 10, summarySize.width, 330);
    [self.view addSubview:summaryView];
    
    /*
    UILabel *summaryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    summaryLabel.backgroundColor = [UIColor lightGrayColor];
    summaryLabel.textColor = [UIColor blackColor];
    summaryLabel.font = [UIFont systemFontOfSize:14];
    summaryLabel.text = _appInfo.summary;
    summaryLabel.numberOfLines = 0;
    CGFloat summaryWidth = [[UIScreen mainScreen] bounds].size.width - 40;
    CGSize summarySize = [_appInfo.summary boundingRectWithSize:CGSizeMake(summaryWidth, CGFLOAT_MAX)
                                   options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                                        context:nil].size;
    summaryLabel.frame = CGRectMake(20, imageView.frame.origin.y + imageHeight + 20, summarySize.width, summarySize.height);
    [self.view addSubview:summaryLabel];
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return  NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
