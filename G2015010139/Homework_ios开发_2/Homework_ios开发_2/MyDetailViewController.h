//
//  MyDetailViewController.h
//  Homework_ios开发_2
//
//  Created by john on 15/9/29.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *content;

@property (nonatomic, strong) UIImage * imageImage;
@property (nonatomic, copy) NSString * nameText;
@property (nonatomic, copy) NSString * contentText;

@end
