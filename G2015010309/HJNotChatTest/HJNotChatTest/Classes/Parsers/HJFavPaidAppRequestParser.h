//
//  HJFavPaidAppRequestParser.h
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJAppInfo.h"

@interface HJFavPaidAppRequestParser : NSObject<NSXMLParserDelegate> {
    NSMutableArray *_appArray;
    NSMutableString *_currentValue;
    HJAppInfo       *_currentAppInfo;
    NSMutableArray  *_currentImgArray;
}

- (NSArray *)parsrJson: (NSData *)data;
- (NSArray *)parseXML: (NSData *)data;

@end
