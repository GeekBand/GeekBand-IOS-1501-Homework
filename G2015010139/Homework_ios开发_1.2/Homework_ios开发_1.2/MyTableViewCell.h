//
//  MyTableViewCell.h
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/28.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *appName;
@property (strong, nonatomic) IBOutlet UILabel *appSummary;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *category;
@property (strong, nonatomic) IBOutlet UILabel *releaseTime;
@property (strong, nonatomic) IBOutlet UILabel *company;

- (void)cleanComponents;


@end
