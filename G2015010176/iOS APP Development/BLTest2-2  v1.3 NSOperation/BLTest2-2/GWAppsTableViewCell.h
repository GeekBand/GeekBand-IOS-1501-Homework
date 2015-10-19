//
//  GWAppsTableViewCell.h
//  BLTest2
//
//  Created by Will Ge on 8/23/15.
//  weakright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"


@interface GWAppsTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *appImage;
@property (weak, nonatomic) IBOutlet UILabel     *appTitle;
@property (weak, nonatomic) IBOutlet UILabel     *appCategory;
@property (weak, nonatomic) IBOutlet UITextView  *appSummary;


@end
