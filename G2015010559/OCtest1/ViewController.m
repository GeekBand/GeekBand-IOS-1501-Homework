//
//  ViewController.m
//  oc1
//
//  Created by ZHY on 15/8/8.
//  Copyright (c) 2015年 ZHY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        Animal *one=[[Animal alloc] initWithName:@"嘻嘻" Weight:20 Sex:male];
        [one sayMy];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    for (int i=0; i<10; i++) {
        Fish *fish=[[Fish alloc]init];
        [array addObject:fish];
        Bird *bird=[[Bird alloc]init];
        [array addObject:bird];
    }
    for (id element in array) {
        if ([[element class]isSubclassOfClass:[Bird class]]) {
            [Bird fly];
        }
        else if (([[element class]isSubclassOfClass:[Fish class]]))
        {
            [Fish swim];
        }
        
    }
    NSLog(@"打猎到了%lu只鸟",(unsigned long) [Bird hunt]);
    NSLog(@"打捞到了%lu只鱼",(unsigned long) [Fish hunt]);

    [array removeAllObjects];
    
}
//-(void)dealloc{
//    [super dealloc];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

@end
