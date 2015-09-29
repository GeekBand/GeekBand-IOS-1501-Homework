//
//  ViewController.m
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/28.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "ViewController.h"
#import "MyRequest.h"
#import "MyTableViewCell.h"
#import "MyParser.h"
#import "MyCellModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageArray = [[NSMutableArray alloc] init];
    
    MyRequest * request = [[MyRequest alloc] init];
    
    NSString * url = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json";
    [request RequestWithURL:url Success:^(NSData * jsonData){
        
        NSLog(@"DownloadTime = %f", [request DownloadTime]);
        NSError *error = nil;
        NSDictionary * jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"Error happens");
        }
        
        NSMutableArray * array = [jsonDic valueForKeyPath:@"feed.entry"];
        self.array = [[NSMutableArray alloc] init];
        [self.array addObjectsFromArray:array];
        

        
        self.cellArray = [MyParser parseWithArray:self.array];
        
//        NSLog(@"Parse complete.");
        
        [self.tableView reloadData];
        
    }Failure:^(NSError * error){
        
        NSLog(@"%@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate and DataSourceDelegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    NSLog(@"Rownumber is running.");
    return [self.cellArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyTableViewCell * cell = [self.tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifier"];
    MyCellModel * model = [self.cellArray objectAtIndex:indexPath.row];
    
    [cell cleanComponents];
    
    cell.appName.text = model.appNameText;
    cell.appSummary.text = model.appSummaryText;
    cell.price.text = model.priceText;
    cell.releaseTime.text = model.releaseTimeText;
    cell.category.text = model.categoryText;
    cell.company.text = model.companyText;
    
    
    
    [cell.appName sizeToFit];
    [cell.price sizeToFit];
    [cell.category sizeToFit];
    [cell.company sizeToFit];
    [cell.releaseTime sizeToFit];
    
    [cell.price.layer setBorderColor:[UIColor blackColor].CGColor];
    [cell.price.layer setBorderWidth:1.0f];
    
    __weak ViewController * weakSelf = self;
    
    NSBlockOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
        
        UIImage * image;
        
        if ([weakSelf.imageArray count] > indexPath.row) {
            image = [weakSelf.imageArray objectAtIndex:indexPath.row];
        } else {
            
            NSURL *nsUrl = [NSURL URLWithString:model.imageUrl];
            NSData *data = [[NSData alloc] initWithContentsOfURL:nsUrl];
            image = [[UIImage alloc] initWithData:data];
            [weakSelf.imageArray addObject:image];
        }
        
//        NSLog(@"Image downloads successfully.");

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            cell.image.image = image;
        }];
    }];
    
    
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.cellArray == nil) {
        return 0;
    }
    return ((MyCellModel *)[self.cellArray objectAtIndex:indexPath.row]).summaryHeight + 200;
}

@end


