//
//  HJFavAppInfoViewController.h
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJFavAppInfoViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *FavAppTableView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (strong, nonatomic) IBOutlet UIImageView *bakImgView;
@property (strong, nonatomic) IBOutlet UILabel *hintLabel;

@end
