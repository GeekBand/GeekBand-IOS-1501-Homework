//
//  GBMViewDetailViewController.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBMViewDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (copy, nonatomic) NSString *pic_id;
@property (copy, nonatomic) NSString *pic_url;
@property (strong,nonatomic) NSArray *commentArr;
           
@end
