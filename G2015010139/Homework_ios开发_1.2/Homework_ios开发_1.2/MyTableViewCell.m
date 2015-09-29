//
//  MyTableViewCell.m
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/28.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
//    NSBlockOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
//        
//        NSURL *nsUrl = [NSURL URLWithString:self.imageUrl];
//        NSData *data = [[NSData alloc] initWithContentsOfURL:nsUrl];
//        UIImage * image = [[UIImage alloc] initWithData:data];
//        
//        
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            
//            self.image.image = image;
//        }];
//    }];
//    
//    
//    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:operation];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cleanComponents {
    
    self.appName.text = nil;
    self.appSummary.text = nil;
    self.price.text = nil;
    self.category.text = nil;
    self.company.text = nil;
    self.releaseTime.text = nil;
    self.image.image = nil;
}

@end
