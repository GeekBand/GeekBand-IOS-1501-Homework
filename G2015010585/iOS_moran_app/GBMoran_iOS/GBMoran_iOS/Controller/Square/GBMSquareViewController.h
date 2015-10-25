//
//  GBMSquareViewController.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface GBMSquareViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *pic_url;
@property (nonatomic, strong) NSString *pic_id;
@property (nonatomic, strong) NSMutableDictionary *locationDic;


@end
