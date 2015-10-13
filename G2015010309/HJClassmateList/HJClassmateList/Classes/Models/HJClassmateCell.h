//
//  HJClassmateCell.h
//  HJClassmateList
//
//  Created by HeJay on 9/6/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJClassmate.h"

@interface HJClassmateCell : UITableViewCell

@property (nonatomic, strong) UIButton *headButton;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *commentLabel;

- (void)setClassmate: (HJClassmate *)classmate;

@end
