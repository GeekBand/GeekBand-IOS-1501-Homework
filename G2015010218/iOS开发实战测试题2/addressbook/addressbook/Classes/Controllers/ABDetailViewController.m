//
//  ABDetailViewController.m
//  addressbook
//
//  Created by 黄纪银163 on 15/9/1.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ABDetailViewController.h"

@implementation ABDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameLabel.text = self.schoolmate.name;
    self.phoneLabel.text = self.schoolmate.phoneNumber;
    if (self.schoolmate.icon) {
        
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                 NSUserDomainMask,
                                                                 YES) firstObject];
        
        NSString *imageSavePath = [docPath stringByAppendingPathComponent:self.schoolmate.icon];
        self.iconView.image = [UIImage imageWithContentsOfFile:imageSavePath];
    }
}

@end
