//
//  BLLoginRequestParser.h
//  Xcode_learn
//
//  Created by house on 15/8/15.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LUser.h"
#import "LAddress.h"
@interface BLLoginRequestParser : NSObject <NSXMLParserDelegate>{
    LUser *_user;
    LAddress *_address;
    NSMutableString *_currentValue;
}
-(LUser *)parserJson:(NSData *)data;
-(LUser *)parserXML:(NSData *)data;

@end
