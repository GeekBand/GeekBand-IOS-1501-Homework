//
//  ZOPParserData.h
//  jsonxml
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//  解析数据

/**
 http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json
 */

#import <Foundation/Foundation.h>
typedef void(^ParserDataFinished)(id modelObj, NSError *error);

@interface ZOPParserData : NSObject
/** 解析JSON数据 */
- (void) parserJSONData:(NSData *)data finished:(ParserDataFinished)finished;
/** 解析XML数据 */
- (void) parserXMLData:(NSData *)data finished:(ParserDataFinished)finished;
@end
