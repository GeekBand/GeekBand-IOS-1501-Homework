//
//  LYThreeViewController.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYThreeViewController.h"
#import "LYTableViewController1.h"
#import "LYTableViewController2.h"
#import "LYTableViewController3.h"

#define kPresentButtonTag1     300
#define kPresentButtonTag2     301
#define kPresentButtonTag3     302

@interface LYThreeViewController ()

@end

@implementation LYThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Question5";
    //present1
    UIButton *presentButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton1.tag = kPresentButtonTag1;
    presentButton1.frame = CGRectMake(10, 80, self.view.bounds.size.width - 20, 40);
    [presentButton1 setBackgroundColor:[UIColor clearColor]];
    [presentButton1 setTitleColor:[UIColor colorWithRed:30 / 255.0f green:90 / 255.0f blue:19 / 255.0f alpha:1] forState:UIControlStateNormal];
    UIImage *whiteBGImage = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableWhiteBGImage = [whiteBGImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [presentButton1 setBackgroundImage:stretchableWhiteBGImage
                             forState:UIControlStateNormal];
    [presentButton1 setTitle:@"Test No.5.1" forState:UIControlStateNormal];
    [presentButton1 setTitle:@"clicked!!!" forState:UIControlStateHighlighted];
    [presentButton1 addTarget:self
                      action:@selector(buttonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton1];
    //present2
    UIButton *presentButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton2.tag = kPresentButtonTag2;
    presentButton2.frame = CGRectMake(10, 140, self.view.bounds.size.width - 20, 40);
    [presentButton2 setBackgroundColor:[UIColor clearColor]];
    [presentButton2 setTitleColor:[UIColor colorWithRed:30 / 255.0f green:90 / 255.0f blue:19 / 255.0f alpha:1] forState:UIControlStateNormal];
    UIImage *whiteBGImage2 = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableWhiteBGImage2 = [whiteBGImage2 stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [presentButton2 setBackgroundImage:stretchableWhiteBGImage2
                              forState:UIControlStateNormal];
    [presentButton2 setTitle:@"Test No.5.2" forState:UIControlStateNormal];
    [presentButton2 setTitle:@"clicked!!!" forState:UIControlStateHighlighted];
    [presentButton2 addTarget:self
                       action:@selector(buttonClicked:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton2];
    //present3
    UIButton *presentButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton3.tag = kPresentButtonTag3;
    presentButton3.frame = CGRectMake(10, 200, self.view.bounds.size.width - 20, 40);
    [presentButton3 setBackgroundColor:[UIColor clearColor]];
    [presentButton3 setTitleColor:[UIColor colorWithRed:30 / 255.0f green:90 / 255.0f blue:19 / 255.0f alpha:1] forState:UIControlStateNormal];
    UIImage *whiteBGImage3 = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableWhiteBGImage3 = [whiteBGImage3 stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    [presentButton3 setBackgroundImage:stretchableWhiteBGImage3
                              forState:UIControlStateNormal];
    [presentButton3 setTitle:@"Test No.5.3" forState:UIControlStateNormal];
    [presentButton3 setTitle:@"clicked!!!" forState:UIControlStateHighlighted];
    [presentButton3 addTarget:self
                       action:@selector(buttonClicked:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton3];
}

#pragma mark - Custom event methods


- (void)buttonClicked:(UIButton *)sender
{
    if (sender.tag == kPresentButtonTag1) {
         LYTableViewController1 *tableViewController1 = [[LYTableViewController1 alloc] init];
        [self presentViewController:tableViewController1 animated:YES completion:nil];
        
    }else if(sender.tag == kPresentButtonTag2) {
        LYTableViewController2 *tableViewController2 = [[LYTableViewController2 alloc] init];
        [self presentViewController:tableViewController2 animated:YES completion:nil];
    }else if (sender.tag == kPresentButtonTag3){
        LYTableViewController3 *tableViewController3 = [[LYTableViewController3 alloc] init];
        [self presentViewController:tableViewController3 animated:YES completion:nil];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end