//
//  WZMessage.h
//  GeekBandHomeWork02
//
//  Created by Warren on 15/9/2.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    WZMessageTypeSelf = 0,
    WZMessageTypeOther = 1
}WZMessageType;

@interface WZMessage : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) WZMessageType messageType;


//默认是NO 不隐藏（显示）时间
@property (nonatomic, assign, getter=isHiddenTime) BOOL hiddenTime;


//- (instancetype)initWithText:(NSString *)text andMessageType:(WZMessageType)messagetype;
//+ (instancetype)messageWithText:(NSString *)text andMessageType:(WZMessageType)messagetype;

@end
