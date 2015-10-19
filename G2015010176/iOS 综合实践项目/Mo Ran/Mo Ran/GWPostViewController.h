//
//  GWPostViewController.h
//  Mo Ran
//
//  Created by Will Ge on 9/20/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWPostViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)camera:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *info;
@property (weak, nonatomic) IBOutlet UILabel *location;

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)post:(UIBarButtonItem *)sender;


@end
