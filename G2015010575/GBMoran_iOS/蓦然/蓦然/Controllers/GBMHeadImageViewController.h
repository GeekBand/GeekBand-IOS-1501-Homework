//
//  GBMHeadImageViewController.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBMGlobal.h"
@class GBMHeadImageViewController;



@interface GBMHeadImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *changeHeadImageButton;
@property (nonatomic, weak) UIImage *headImage;


- (IBAction)doneBarButtonClicked:(id)sender;
- (IBAction)changeHeadImageButtonClicked:(id)sender;

@end
