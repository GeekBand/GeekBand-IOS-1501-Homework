//
//  WXMessageViewController.m
//  weixinTableView
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "WXMessageViewController.h"
#import "WXMessageCell.h"
#import "WXMessage.h"

@interface WXMessageViewController ()
/** 消息数组 */
@property (nonatomic, copy) NSArray *messages;

@end

@implementation WXMessageViewController
#pragma mark - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // 标题
    self.title = @"微信聊一聊";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - UITableView DataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出消息数据
    WXMessage *message = self.messages[indexPath.row];
    
    WXMessageCell *cell = nil;
    
    if (message.isMyMessage) {
        // 自己发的在右边
        cell = [tableView dequeueReusableCellWithIdentifier:MessageRightCellId];
    }
    else
    {
        // 好友发的在左边
        cell = [tableView dequeueReusableCellWithIdentifier:MessageLeftCellId];
    }
    // 设置cell数据
    cell.userIcon.image = [UIImage imageNamed:message.icon];
    cell.messageLabel.text = message.message;
    return cell;
}

#pragma mark - UITableView Delegate Methods

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXMessage *message = self.messages[indexPath.row];
    CGFloat messageLabelH = message.messageH + 20;
    return (messageLabelH > 50) ? messageLabelH : 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Getter Methods
- (NSArray *)messages
{
    if (!_messages) {
        NSMutableArray *arrayM = [NSMutableArray array];
        
        // 加入数据
        NSArray *messageSections = @[@"先帝创业未半而中道崩殂，今天下三分，益州疲弊，此诚危急存亡之秋也。然侍卫之臣不懈于内，忠志之士忘身于外者，盖追先帝之殊遇，欲报之于陛下也。诚宜开张圣听，以光先帝遗德，恢弘志士之气，不宜妄自菲薄，引喻失义，以塞忠谏之路也。",
                                    
                                    @"宫中府中，俱为一体，陟罚臧否，不宜异同。若有作奸犯科及为忠善者，宜付有司论其刑赏，以昭陛下平明之理，不宜偏私，使内外异法也。",
                                    
                                    @"对面的女孩看过来！",
                                    
                                    @"侍中侍郎郭攸之、费祎、董允等，此皆良实，志虑忠纯，是以先帝简拔以遗陛下。愚以为宫中之事，事无大小，悉以咨之，然后施行，必能裨补阙漏，有所广益。 ",
                                    
                                    @"哈哈",
                                    
                                    @"今当远离，临表涕零，不知所言。",
                                    
                                    @"泥马！",
                                    
                                    @"yes."];
        
        NSString *myIcon = @"dragon";
        NSString *friendIcon = @"icon120";
        
        for (NSInteger i = 0; i<20; i++) {
            WXMessage *message = [[WXMessage alloc] init];
            // 随机消息
            NSInteger random = arc4random_uniform(8);
            message.message = messageSections[random];
            
            // 头像
            if (i % 2) {
                message.myMessage = YES;
                message.icon = myIcon;
            }
            else
            {
                message.myMessage = NO;
                message.icon = friendIcon;
            }
            
            // 文字高度
            CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
            CGSize contenSize = CGSizeMake(screenWidth - 160.0, CGFLOAT_MAX);
            NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:18]};
            
            CGSize messageSize = [message.message boundingRectWithSize:contenSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
            
            message.messageH = messageSize.height;
            
            [arrayM addObject:message];
        }
        
        _messages = [arrayM copy];
        
    }
    return _messages;
}


@end
