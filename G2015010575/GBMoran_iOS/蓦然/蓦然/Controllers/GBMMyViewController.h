//
//  GBMMyViewController.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBMHeadImageViewController.h"
#import "GBMNickNameViewController.h"
#import "GBMGlobal.h"

@interface GBMMyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end
