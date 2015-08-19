//
//  ViewController.m
//  OCHomeWork
//
//  Created by house on 15/8/12.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "ViewController.h"
#import "Fish.h"
#import  "Bird.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    题目三 ，使用一个数组
    NSMutableArray *annimalArray=[[NSMutableArray alloc]initWithCapacity:20];
    SEX sex =MALE;
    for (int i=0; i<20; i++) {
        sex = !sex;
        if (i%2==0) {
            Bird *bird=[[Bird alloc]initWithName:[NSString stringWithFormat:@"bird%i",i] weight:[[NSNumber numberWithInt:i] floatValue]sex:sex];
            [annimalArray addObject:bird];
            
        }else{
            Fish *fish=[[Fish alloc]initWithName:[NSString stringWithFormat:@"fish%i",i] weight:[[NSNumber numberWithInt:i] floatValue]sex:sex];
            [annimalArray addObject:fish];
        }
    }
    
    for (id object in annimalArray) {
        if ([[object class]isSubclassOfClass:[Fish class]]) {
            [(Fish *)object swim];
        }else if([[object class]isSubclassOfClass:[Bird class]]) {
            [(Bird *)object fly];
        }
    }
    
//   题目四 捞鱼
    
  
    NSLog(@"数组中有%lu个动物",[annimalArray count]);
    NSInteger count=  arc4random()%10;
    NSInteger i=0;
    while (i!=count) {
        NSInteger index = arc4random()%[annimalArray count];
        if ([[[annimalArray objectAtIndex:index] class]isSubclassOfClass:[Fish class]]) {
            i++;
            [annimalArray removeObjectAtIndex:index];
        }
    }
    NSLog(@"随机捞掉%lu只鱼，数组中还剩%lu个动物",count,[annimalArray count]);
    
//捕鸟
    NSLog(@"数组中有%lu个动物",[annimalArray count]);
    NSInteger birdcount=  arc4random()%10;
    NSInteger j=0;
    while (j!=birdcount) {
        NSInteger index = arc4random()%[annimalArray count];
        if ([[[annimalArray objectAtIndex:index] class]isSubclassOfClass:[Bird class]]) {
            j++;
            [annimalArray removeObjectAtIndex:index];
        }
    }
    NSLog(@"随机打了%lu只鸟，数组中还剩%lu个动物",birdcount,[annimalArray count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
