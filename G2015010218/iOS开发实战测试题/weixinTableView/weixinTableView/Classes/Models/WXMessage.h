//
//  WXMessage.h
//  weixinTableView
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WXMessage : NSObject
/** 用户名 */
@property (nonatomic, copy) NSString *userName;
/** 用户头像 */
@property (nonatomic, copy) NSString *icon;
/** 聊天消息 */
@property (nonatomic, copy) NSString *message;
/** 是否自己发的消息 */
@property (nonatomic, assign, getter=isMyMessage) BOOL myMessage;
/** 消息的文字高度 */
@property (nonatomic, assign) double messageH;

@end
