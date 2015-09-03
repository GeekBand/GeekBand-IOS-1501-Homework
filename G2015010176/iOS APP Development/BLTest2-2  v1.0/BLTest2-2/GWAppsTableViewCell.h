//
//  GWAppsTableViewCell.h
//  BLTest2
//
//  Created by Will Ge on 8/23/15.
//  weakright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWAppsTableViewCell : UITableViewCell

@property (weak, nonatomic, readonly) IBOutlet UIImageView *appImage;
@property (weak, nonatomic, readonly) IBOutlet UILabel *appTitle;
@property (weak, nonatomic, readonly) IBOutlet UILabel *appCategory;
@property (weak, nonatomic, readonly) IBOutlet UITextView *appSummary;

@end
