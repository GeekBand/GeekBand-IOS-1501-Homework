//
//  IZChatTableViewController.m
//  GeekBandHomeworkOC02
//
//  Created by Liang Zisheng on 9/12/15.
//  Copyright (c) 2015 ALMOND. All rights reserved.
//

#import "IZChatTableViewController.h"
#import "Masonry.h"

@interface IZChatTableViewController ()

@end

@implementation IZChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.chatsList = [@[@{@"user":@"host",
                          @"image":[UIImage imageNamed:@"host_square"],
                          @"message":@"Hi, Let's talk about some philosophy"
                          },
                        @{@"user":@"guest",
                          @"image":[UIImage imageNamed:@"lord-vader_square"],
                          @"message":@"Good, The Communist Manifestowas a powerful and coherent call to arms but was not scientific. It provided no thorough theoretical basis for revolution and the end of Capitalism. This would be provided by Marx and Engels' vast output of other books, pamphlets and polemics, some published after Marx's death."
                          },
                        ] mutableCopy];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.chatsList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *text = [self.chatsList[indexPath.row] valueForKey:@"message"];
    CGSize size = [text boundingRectWithSize:CGSizeMake(tableView.frame.size.width, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                     context:nil].size;
    return size.height + 66;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        for (UIView *cellView in cell.subviews){
            [cellView removeFromSuperview];
        }
    }
    
    // configure the cell
    BOOL isSelf = [[self.chatsList[indexPath.row] objectForKey:@"user"] isEqualToString:@"host"];
    UIImage *avatar = [UIImage imageNamed:isSelf ? @"host_square" : @"lord-vader_square"];
    
    [cell addSubview:[self avatarView:avatar
                               IsSelf:isSelf
                         WithPosition:isSelf ? self.view.frame.size.width - 65 : 10]];
    [cell addSubview:[self messageView:[self.chatsList[indexPath.row] objectForKey:@"message"]
                              FromSelf:isSelf
                           WithPostion:isSelf ? self.view.frame.size.width - (65 + 15) : 65 + 5]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - custom methods
- (UIImageView *)avatarView:(UIImage *)image IsSelf:(BOOL)isSelf WithPosition:(int)postion {
    UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    CGRect rect = CGRectMake(postion, 10, 50, 50);
    UIImage *avatar = image;
    
    avatarView.frame = rect;
    avatarView.image = avatar;
    avatarView.contentMode = UIViewContentModeScaleAspectFit;
    avatarView.clipsToBounds = YES;
    
    
    return avatarView;
}

- (UIView *)messageView:(NSString *)text FromSelf:(BOOL)isSelf WithPostion:(int)postion {
    UIView *messageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 120, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                     context:nil].size;
    
    CGRect rect = CGRectMake(20, 10, size.width + 10, size.height + 10);
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:rect];
    messageLabel.text = text;
    messageLabel.font = [UIFont systemFontOfSize:14];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.numberOfLines = 0;
    messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    UIImageView *bgImageview = [[UIImageView alloc] init];
    UIImage *bgImage = [UIImage imageNamed:isSelf ? @"bgChatFromSelf" : @"bgChatFromOther"];
    bgImageview.frame = CGRectMake(0, 0, size.width + 40, size.height + 25);
    bgImageview.image = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(floorf(bgImage.size.height/2), floorf(bgImage.size.width/2), floorf(bgImage.size.height/2)-1, floorf(bgImage.size.width/2)-1) resizingMode:UIImageResizingModeStretch];
    
    
    messageView.frame = CGRectMake(isSelf ? postion - size.width - 15 : postion, 10, size.width + 35, size.height + 40);
    //messageView.backgroundColor = [UIColor lightGrayColor];
    [messageView addSubview:bgImageview];
    [messageView addSubview:messageLabel];
    
    return messageView;
}


@end
