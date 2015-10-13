//
//  WZDetailViewController.h
//  GeekHomework02_2
//
//  Created by Warren on 15/9/7.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZMessage.h"

@interface WZDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *otherLabel;

@property (nonatomic, strong) WZMessage *message;

@end
