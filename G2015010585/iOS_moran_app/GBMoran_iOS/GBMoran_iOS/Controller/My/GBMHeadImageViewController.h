//
//  GBMHeadImageViewController.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/22/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBMHeadImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *changeHeadImageButton;
@property (weak, nonatomic) UIImage *headImage;

- (IBAction)doneBarButtonClicked:(id)sender;
- (IBAction)changeHeadImageButtonClicked:(id)sender;


@end
