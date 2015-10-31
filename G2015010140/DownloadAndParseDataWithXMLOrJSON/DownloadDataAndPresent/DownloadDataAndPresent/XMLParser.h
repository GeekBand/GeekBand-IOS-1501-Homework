//
//  XMLParser.h
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
#import "GameAttributes.h"

@protocol XMLParserDelegate

- (void)finishParsingAndReturnGamesAttributes:(NSArray *) gamesAttributes;

@end

@interface XMLParser : NSObject <NSXMLParserDelegate>{
    Author *_author;
    NSMutableArray *_gamesAttributes;
    NSMutableString *_currentString;
    GameAttributes *_currentGameAttributes;
}

@property (weak, nonatomic) id<XMLParserDelegate> delegate;

- (void)parseAXMLData:(NSData *)data;

@end
