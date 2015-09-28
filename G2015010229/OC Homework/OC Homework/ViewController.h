//
//  ViewController.h
//  OC Homework
//
//  Created by 张弢 on 15/8/16.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *_animals;
    NSMutableArray *_birds;
    NSMutableArray *_fishes;
}

@property (strong, nonatomic) IBOutlet UILabel *birdInfoLabel;
@property (strong, nonatomic) IBOutlet UILabel *fishInfoLabel;

- (IBAction)shootBird:(id)sender;
- (IBAction)catchFish:(id)sender;
- (IBAction)reset:(id)sender;

@end

