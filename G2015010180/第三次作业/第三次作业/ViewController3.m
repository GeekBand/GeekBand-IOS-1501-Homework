//
//  ViewController3.m
//  第三次作业
//
//  Created by 陈铭嘉 on 15/8/31.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "ViewController3.h"

@implementation ViewController3


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情界面";
    self.name.text = self.model.name;
    self.label.text = self.model.word;
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathNum1 = [pathArr objectAtIndex:0];
    NSString *path = [pathNum1 stringByAppendingPathComponent:self.model.word];
    self.model.image = path;
    self.image.image = [UIImage imageWithContentsOfFile:self.model.image];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
