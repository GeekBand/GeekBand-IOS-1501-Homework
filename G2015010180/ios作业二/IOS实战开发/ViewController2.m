//
//  ViewController2.m
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/26.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import "ViewController2.h"
#import "Cell2.h"
#import "Cell1.h"
@interface ViewController2 ()
{
    NSArray *array;
}
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
//    self.view.backgroundColor = [[UIColor alloc]initWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    self.view.backgroundColor = [[UIColor alloc]initWithRed:57/255.0 green:164/255.0 blue:249/255.0 alpha:1];
    [self makeArray];
    self.title = @"作业一";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;
}


-(CGFloat)tableView:(nonnull UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSString *string = [array objectAtIndex:indexPath.row];
    CGSize sizeName =  [string sizeWithFont:[UIFont systemFontOfSize:14]
                         constrainedToSize:CGSizeMake(209, MAXFLOAT)
                             lineBreakMode:NSLineBreakByWordWrapping];
    if (sizeName.width+30 > 209) {
        return sizeName.height+60;
    }else{
    return 90;
    }
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row %2 == 1) {
        Cell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[Cell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell1"];
        }
        cell.backgroundColor = [[UIColor alloc]initWithRed:212/255.0 green:234/255.0 blue:164/255.0 alpha:1];
        cell.TalkView.layer.cornerRadius = 8.0;
        cell.TalkView.layer.borderWidth = 2.0;
        cell.TalkView.layer.borderColor = [UIColor blackColor].CGColor;
        cell.TalkView.layer.masksToBounds = YES;
        cell.PeopleImage.image = [UIImage imageNamed:@"Untitled.jpg"];
        NSString *string = [array objectAtIndex:indexPath.row];
        cell.TalkWord.text = string;
        CGSize sizeName = [string sizeWithFont:cell.TalkWord.font
                             constrainedToSize:CGSizeMake(209, MAXFLOAT)
                                 lineBreakMode:NSLineBreakByWordWrapping];
        if (sizeName.width+30 < cell.TalkView.frame.size.width) {
                 [cell.TalkView setFrame:CGRectMake(cell.TalkView.frame.origin.x, cell.TalkView.frame.origin.y, sizeName.width+30, cell.TalkView.frame.size.height)];
        }
        
        if (sizeName.width+30 > cell.TalkView.frame.size.width) {
            
            
           
            [cell.TalkView setFrame:CGRectMake(cell.TalkView.frame.origin.x, cell.TalkView.frame.origin.y,cell.TalkView.frame.size.width, sizeName.height+30)];
            [cell.TalkWord setFrame:CGRectMake(cell.TalkWord.frame.origin.x, cell.TalkWord.frame.origin.y,cell.TalkView.frame.size.width, sizeName.height+30)];
        }
   
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }else if(indexPath.row %2 == 0){
        Cell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[Cell2 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell2"];
        }
        cell.backgroundColor = [[UIColor alloc]initWithRed:212/255.0 green:234/255.0 blue:164/255.0 alpha:1];
         cell.TalkView.layer.cornerRadius = 8.0;
        cell.TalkView.layer.borderWidth = 2.0;
        cell.TalkView.layer.borderColor = [UIColor blackColor].CGColor;
        cell.TalkView.layer.masksToBounds = YES;
         cell.PeopleImage.image = [UIImage imageNamed:@"Untitled2.jpg"];
        NSString *string = [array objectAtIndex:indexPath.row];
        cell.TalkWord.text = string;
        CGSize sizeName = [string sizeWithFont:cell.TalkWord.font
                             constrainedToSize:CGSizeMake(209, MAXFLOAT)
                                 lineBreakMode:NSLineBreakByWordWrapping];
        if (sizeName.width+30 < cell.TalkView.frame.size.width) {
            [cell.TalkView setFrame:CGRectMake(cell.TalkView.frame.origin.x+(cell.TalkView.frame.size.width-(sizeName.width+30)), cell.TalkView.frame.origin.y, sizeName.width+30, cell.TalkView.frame.size.height)];
        }
        
        if (sizeName.width+30 > cell.TalkView.frame.size.width) {
            [cell.TalkWord setFrame:CGRectMake(cell.TalkView.frame.origin.x, cell.TalkView.frame.origin.y,cell.TalkView.frame.size.width, sizeName.height+30)];
            [cell.TalkView setFrame:CGRectMake(cell.TalkView.frame.origin.x, cell.TalkView.frame.origin.y,cell.TalkView.frame.size.width, sizeName.height+30)];
            
        }
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }
    return nil;
}

-(void)makeArray{
    array = [NSArray arrayWithObjects:@"你好",@"你也是",@"哈哈",@"好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊好久不见了啊",@"下次来我家里玩啊,下次来我家里玩啊,下次来我家里玩啊,下次来我家里玩啊,下次来我家里玩啊,下次来我家里玩啊,下次来我家里玩啊,下次来我家里玩啊",@"我请你吃饭好不好",@"怎么才能像你一样钮呢",nil];
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
