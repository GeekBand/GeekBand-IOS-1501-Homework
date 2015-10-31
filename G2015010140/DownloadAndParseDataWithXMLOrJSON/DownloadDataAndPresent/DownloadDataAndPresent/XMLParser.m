//
//  XMLParser.m
//  DownloadDataAndPresent
//
//  Created by Turtleeeeeeeeee on 15/9/3.
//  Copyright (c) 2015年 SCNU. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

- (void)parseAXMLData:(NSData *)data {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    if (![parser parse]) {
        NSLog(@"XML parser aborts...");
    }
}

#pragma XMLParserDelegate
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    _gamesAttributes = [NSMutableArray array];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"author"]) {
        _author = [Author sharedAuthor];
    }
    if ([elementName isEqualToString:@"name"]) {
        _currentString = [NSMutableString string];
    }
    if ([elementName isEqualToString:@"uri"]) {
        _currentString = [NSMutableString string];
    }
    if ([elementName isEqualToString:@"entry"]) {
        _currentGameAttributes = [[GameAttributes alloc] init];
    }
    if ([elementName isEqualToString:@"im:name"]) {
        _currentString = [NSMutableString string];
    }
    if ([elementName isEqualToString:@"im:image"]) {
        if ([[attributeDict objectForKey:@"height"] isEqualToString:@"75"]) {
            _currentString = [NSMutableString string];
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [_currentString appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"author"]) {
        
    }
    if ([elementName isEqualToString:@"name"] && _author != nil) {
        _author.name = _currentString;
        _currentString = nil;
    }
    if ([elementName isEqualToString:@"uri"] && _author != nil) {
        _author.uri = _currentString;
        _currentString = nil;
    }
    if ([elementName isEqualToString:@"entry"] && _currentGameAttributes != nil) {
        [_gamesAttributes addObject:_currentGameAttributes];
        _currentGameAttributes = nil;
    }
    if ([elementName isEqualToString:@"im:name"] && _currentGameAttributes != nil) {
        _currentGameAttributes.name = _currentString;
        _currentString = nil;
    }
    if ([elementName isEqualToString:@"im:image"] && _currentString != nil && _currentGameAttributes != nil) {
        _currentGameAttributes.imageAddress = _currentString;
        _currentString = nil;
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    //返回数组＝。＝
    dispatch_sync(dispatch_get_main_queue(), ^{
        [_delegate finishParsingAndReturnGamesAttributes:[_gamesAttributes copy]];
    });
}

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
    
}

@end
