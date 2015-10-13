//
//  WZMasterTableViewController.m
//  GeekHomework02_2
//
//  Created by Warren on 15/9/7.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZMasterTableViewController.h"
#import "WZMessage.h"
#import "FileManager.h"
#import "WZAddViewController.h"
#import "WZDetailViewController.h"

@interface WZMasterTableViewController ()<UITableViewDataSource, UITableViewDelegate, NSCoding>

@property (nonatomic, strong) NSMutableArray *messageArray;
@property (nonatomic, strong) WZMessage *message;

@end

@implementation WZMasterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.message.name = @"whz";
//    self.message.other = @"123123123";
//    self.message.photoUrl = nil;
//    
////    NSMutableArray *messageArray = [WZGlobal shareGlobal].messageArray;
//    
//    [self.messageArray addObject:self.message];
//    
//    NSString *arrayPath = [FileManager getPathWithinDocumentDir:@"/address/messages"];
//    [FileManager createDirectory:arrayPath lastComponentIsDirectory:NO];
//    NSData *messageData = [FileManager archiverObject:self.messageArray forKey:@"messageArray"];
//    [messageData writeToFile:arrayPath atomically:YES];//实现归档

}

- (void)viewWillAppear:(BOOL)animated
{
    //读取归档的数据
    
    NSString *messageArrayPath = [FileManager getPathWithinDocumentDir:@"/address/messages"];
    NSData *messageData = [NSData dataWithContentsOfFile:messageArrayPath];
    NSMutableArray *messageArray = (NSMutableArray *)[FileManager unarchiverObject:messageData withKey:@"messageArray"];
    self.messageArray = messageArray;//实现解档

}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButton:(UIBarButtonItem *)sender
{
    WZAddViewController *addViewController = [[WZAddViewController alloc] init];
    [self.navigationController presentViewController:addViewController  animated:YES completion:nil];
}

- (WZMessage *)message
{
    if (!_message) {
        _message = [[WZMessage alloc] init];
    }
    return _message;
}

- (NSMutableArray *)messageArray
{
    if (!_messageArray) {
        _messageArray = [[NSMutableArray alloc] init];
    }
    return _messageArray;
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.messageArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                            forIndexPath:indexPath];
    
    self.message = [self.messageArray objectAtIndex:indexPath.row];
    cell.textLabel.text = self.message.name;
    cell.detailTextLabel.text = self.message.other;
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath) {
        [self performSegueWithIdentifier:@"masterToDetail" sender:nil];
    }
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        if (!aDecoder) {
            return nil;
        }
        self.message = [aDecoder decodeObjectForKey:@"message"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.message forKey:@"message"];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    id destinationVC = segue.destinationViewController;
    if ([destinationVC isMemberOfClass:[WZDetailViewController class]]) {
        WZDetailViewController *detailViewController = destinationVC;
        detailViewController.message = [self.messageArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }

}

@end
