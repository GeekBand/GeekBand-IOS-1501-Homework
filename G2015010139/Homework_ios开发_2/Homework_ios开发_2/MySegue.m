//
//  MySegue.m
//  Homework_ios开发_2
//
//  Created by john on 15/9/30.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "MySegue.h"
#import "ViewController.h"
#import "MyAddViewController.h"

@implementation MySegue

- (void)perform {
    

    ViewController * dec = self.destinationViewController;
    MyAddViewController * src = self.sourceViewController;
//    [dec.tableView reloadData];
//    [dec performSelector:@selector(reload) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
    
//    [src.navigationController popToRootViewControllerAnimated:YES];
    
    [src.navigationController popViewControllerAnimated:YES];
    
//    [dec dismissViewControllerAnimated:YES completion:nil];
//    NSInvocationOperation * op = [[NSInvocationOperation alloc] initWithTarget:src selector:@selector(viewDidDisappear:) object:nil];
//    
//    NSBlockOperation * op1 = [NSBlockOperation blockOperationWithBlock:^{
//        [dec reload];
//    }];
//    
//    [op1 addDependency:op];
//    
//    [[NSOperationQueue mainQueue] addOperation:op1];
    
    

}

@end
