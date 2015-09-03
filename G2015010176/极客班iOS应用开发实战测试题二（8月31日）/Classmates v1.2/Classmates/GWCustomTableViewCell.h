//
//  GWCustomTableViewCell.h
//  同学录
//
//  Created by Will Ge on 8/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWCustomTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *uuid;

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel     *name;
@property (weak, nonatomic) IBOutlet UITextView  *info;


@end
