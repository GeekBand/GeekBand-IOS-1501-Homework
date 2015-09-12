//
//  ViewController3.h
//  第三次作业
//
//  Created by 陈铭嘉 on 15/8/31.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface ViewController3 : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property(nonatomic,strong)Model *model;

@end
