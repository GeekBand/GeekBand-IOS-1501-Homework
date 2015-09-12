//
//  WZMessageFrame.m
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/3.
//  Copyright (c) 2015年 Warren. All rights reserved.
//
#import "WZMessageFrame.h"
#import "WZGlobal.h"
#import "NSString+Extension.h"

@implementation WZMessageFrame

+ (NSMutableArray *)messageFrames
{
    if (![[WZGlobal shareGlobal].messageArray count]) {//防止多线程 导致无法获取数据
        return nil;
    }
        NSMutableArray *resultArray;
    
        NSMutableArray *messages = [WZGlobal shareGlobal].messageArray;
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        for (WZMessage *message in messages) {
            WZMessageFrame *messageFrame = [[WZMessageFrame alloc] init];
            messageFrame.message = message;
            [tempArray addObject:messageFrame];
        
            resultArray = tempArray;
        }
    return resultArray;
}

- (NSMutableArray *)messageFrames
{
    if (!_messageFrames) {
        _messageFrames = [WZMessageFrame messageFrames];
    }
    return _messageFrames;
}

- (void)setMessage:(WZMessage *)message
{
    _message = message;
    
    //获取屏幕宽度
    UIScreen *screen = [UIScreen mainScreen];
    
    //time frame
    if (!message.isHiddenTime) {
    
    _timeLabelFrame = CGRectMake(0, 0, screen.bounds.size.width, 40);
    
//设置相同时间不显示时间的frame
//    } else {
//        _timeLabelFrame = CGRectZero;
    }
    //不太好用
    
    //headImage---------------
    CGFloat margin = 10;
    //------------------------
    CGFloat headWidth = 50;
    CGFloat headHeight = 50;
    CGFloat headX;
    CGFloat headY = CGRectGetMaxY(_timeLabelFrame);//设置为时间的最大Y坐标
    if (message.messageType == WZMessageTypeSelf) {
        headX = screen.bounds.size.width - headWidth - margin;
    } else {
        headX = margin;
    }
    _headViewFrame = CGRectMake(headX, headY, headWidth, headHeight);
    
    //textFrame----------------
    CGSize textSize = [message.text sizeWithMaxSize:CGSizeMake(250, CGFLOAT_MAX)
                                           fontSize:WZFontSize];
    CGSize buttonSize = CGSizeMake(textSize.width + 40, textSize.height + 40);//20 * 2 上下左右间距各加40
                       
    CGFloat textY = headY;
    CGFloat textX;
    if (message.messageType == WZMessageTypeSelf) {
        textX = headX - margin - buttonSize.width;
    } else if(message.messageType == WZMessageTypeOther) {
        textX = CGRectGetMaxX(_headViewFrame) + margin; //CGRectGetMaxX(<#CGRect rect#>)获得rect的最大相当于x + width
    }
    _textButtonFrame = CGRectMake(textX, textY, buttonSize.width, buttonSize.height);
    
    //计算行高-----------------
    CGFloat headMaxY = CGRectGetMaxY(_headViewFrame);
    CGFloat textMaxY = CGRectGetMaxY(_textButtonFrame);
    _rowHeight = MAX(headMaxY, textMaxY) + margin;
    
    
}

//计算文字的size
//- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize
//{
//    return [text boundingRectWithSize:maxSize
//                              options:NSStringDrawingUsesLineFragmentOrigin
//                           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}
//                              context:nil].size;
//}


@end
