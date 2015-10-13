//
//  WZParser.h
//  WZAFNetworkingTest
//
//  Created by Warren on 15/8/30.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZMessage.h"

@interface WZParser : NSObject


- (WZMessage *)parserJson:(NSJSONSerialization *)json;

- (WZMessage *)parserXML:(NSXMLParser *)XMLParser;

@end
