//
//  GWDetailViewController.h
//  同学录
//
//  Created by Will Ge on 8/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GWClassmate.h"
#import <Realm/Realm.h>

@interface GWDetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic)          NSString    *uuid;

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextView  *info;

- (IBAction)takePhoto:(UIButton *)sender;

@end
