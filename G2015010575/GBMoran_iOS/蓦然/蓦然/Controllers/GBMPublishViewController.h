//
//  GBMPublishViewController.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBMPublishRequest.h"

@interface GBMPublishViewController : UIViewController<UITextViewDelegate,UITableViewDataSource,UITableViewDelegate
>

@property (strong , nonatomic)UIImage *publishPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *pulishview;

@end
