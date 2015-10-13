//
//  HJClassmateDetailViewController.m
//  HJClassmateList
//
//  Created by HeJay on 9/6/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJClassmateDetailViewController.h"
#import "BLUtility.h"

@interface HJClassmateDetailViewController ()

@end

@implementation HJClassmateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backView.image = [UIImage imageNamed:@"back"];
    [self.view addSubview:backView];
    
    
    NSInteger width = [UIScreen mainScreen].bounds.size.width;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 100, width - 120, 240)];
    imageView.backgroundColor = [UIColor blackColor];
    if (_classmate.imageInBundle) {
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:_classmate.imageName ofType:@"png"];
        imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    } else {
        imageView.image = [UIImage imageWithContentsOfFile:[BLUtility getPathWithinDocumentDir:_classmate.imageName]];
    }
    [self.view addSubview:imageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 360, width - 60, 40)];
    nameLabel.text = [NSString stringWithFormat:@"姓名:  %@", _classmate.name];
    nameLabel.backgroundColor = [UIColor colorWithRed:0.8 green:0.5 blue:0.4 alpha:0.8];
    nameLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:nameLabel];
    
    
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 420, width - 60, 40)];
    commentLabel.text = [NSString stringWithFormat:@"备注:  %@", _classmate.comment];
    commentLabel.backgroundColor = [UIColor colorWithRed:0.8 green:0.5 blue:0.4 alpha:0.8];
    commentLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:commentLabel];
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

@end
