//
//  GWShowDetailViewController.h
//  同学录
//
//  Created by Will Ge on 8/30/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWDetailViewController.h"
#import <UIKit/UIKit.h>
#import "GWClassmate.h"
#import "GWClassmateDBManager.h"

@interface GWShowDetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic)          NSString    *uuid;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextView  *info;

@end
