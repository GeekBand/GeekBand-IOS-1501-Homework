//
//  HJChatTableViewController.m
//  HJNotChatTest
//
//  Created by HeJay on 8/29/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJChatTableViewController.h"
#import "HJChatCell.h"
#import "HJMessage.h"

@interface HJChatTableViewController ()

@end

@implementation HJChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMessageData];
    self.navigationItem.title = @"悟空";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

- (void)createMessageData {
    _messageArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1002 name:@"悟空" headImage:[UIImage imageNamed:@"wukong"]] text:@"师父,今天天气很好，一起去打妖怪如何？"]];

    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1002 name:@"悟空" headImage:[UIImage imageNamed: @"wukong"]] text:@"听说东海龙宫进口了不少宝贝"]];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1001 name:@"为师" headImage:[UIImage imageNamed:@"master"]] text:@"悟空，把八戒和沙僧叫上，带上干粮和水...... 还有你的紧箍咒，别取下来了,观音送我的宝贝袈裟一定要收好，别再给妖怪偷走了。为师就剩下这么一件宝贝了"]];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1002 name:@"悟空" headImage:[UIImage imageNamed:@"wukong"]] text:@"师父, 小心妖怪"]];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1001 name:@"为师" headImage:[UIImage imageNamed:@"master"]] text:@"为师说过多少次了，这里是动物园，笼子里那头熊不是妖怪"]];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1002 name:@"悟空" headImage:[UIImage imageNamed:@"wukong"]] text:@"徒儿错了..."]];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1002 name:@"悟空" headImage:[UIImage imageNamed:@"wukong"]] text:@"您别念紧箍咒..."]];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1001 name:@"为师" headImage:[UIImage imageNamed:@"master"]] text:@"就罚一个月月钱好了..."]];
    
    [_messageArray addObject:[HJMessage messageWithSender:[HJUser uerWithID:1002 name:@"悟空" headImage:[UIImage imageNamed:@"wukong"]] text:@"......"]];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_messageArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"chatCellViewIdentifier";
    HJChatCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[HJChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    HJMessage *message = [_messageArray objectAtIndex:indexPath.row];
    [cell setComponentsWithMessage:message indexPath:indexPath];
    
    if (message.sender.userID == 1002) {
        [cell setHeadImage:[UIImage imageNamed:@"wukong"]];
    } else if (message.sender.userID == 1001) {
        [cell setHeadImage:[UIImage imageNamed:@"master"]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HJMessage *message = [_messageArray objectAtIndex:indexPath.row];
    return [HJChatCell calculateCellHeightWithMessage:message];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
