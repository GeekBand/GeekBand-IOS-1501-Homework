//
//  ZOPParserData.m
//  jsonxml
//
//  Created by 黄纪银163 on 15/8/26.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import "ZOPParserData.h"
#import "ZOPEntry.h"

@interface ZOPParserData ()
<
NSXMLParserDelegate
>
/** xml解析器 */
@property (nonatomic, strong) NSXMLParser *xmlParser;
/** xml解析完回调Block */
@property (nonatomic, copy) ParserDataFinished xmlParserBlock;
/** xml字典 */
@property (nonatomic, strong) NSMutableArray *entrys;
/** 字符串容器 */
@property (nonatomic, strong) NSMutableString *stringM;
@end

@implementation ZOPParserData

- (void)parserJSONData:(NSData *)data finished:(ParserDataFinished)finished
{
    if (data.length <= 0) return;
    
    NSError *error = nil;
    id jsonParser = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    // 装载目录的数组
    NSMutableArray *parserEntrys = [NSMutableArray array];
    
    if ([jsonParser isKindOfClass:[NSDictionary class]]) {
        NSDictionary *feedDict = [jsonParser objectForKey:@"feed"];
        if ([feedDict isKindOfClass:[NSDictionary class]]) {
            NSArray *entrys = [feedDict objectForKey:@"entry"];
            
            if ([entrys isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *entryDict in entrys) {
                    // 目录实例
                    ZOPEntry *entry = [[ZOPEntry alloc] init];
                    
                    // 名字
                    NSDictionary *nameDict = [entryDict objectForKey:@"im:name"];
                    if ([nameDict isKindOfClass:[NSDictionary class]])
                    {
                        NSString *name = [nameDict objectForKey:@"label"];
                        if ([name isKindOfClass:[NSString class]])
                        {
                            entry.name = name;
                        }
                    }
                    
                    // 图片
                    NSArray *images = [entryDict objectForKey:@"im:image"];
                    if ([images isKindOfClass:[NSArray class]])
                    {
                        NSDictionary *imageDict = [images lastObject];
                        
                        if ([imageDict isKindOfClass:[NSDictionary class]])
                        {
                            NSString *imageURL = [imageDict objectForKey:@"label"];
                            if ([imageURL isKindOfClass:[NSString class]])
                            {
                                entry.imageURL = imageURL;
                            }
                        }
                    }
                    // 描述
                    NSDictionary *summaryDict = [entryDict objectForKey:@"summary"];
                    if ([summaryDict isKindOfClass:[NSDictionary class]])
                    {
                        NSString *summary = [summaryDict objectForKey:@"label"];
                        if ([summary isKindOfClass:[NSString class]])
                        {
                            entry.summary = summary;
                        }
                    }
                    
                    // 价格
                    NSDictionary *priceDict = [entryDict objectForKey:@"im:price"];
                    if ([priceDict isKindOfClass:[NSDictionary class]])
                    {
                        NSString *price = [priceDict objectForKey:@"label"];
                        if ([price isKindOfClass:[NSString class]])
                        {
                            entry.price = price;
                        }
                    }
                    
                    // 类型
                    NSDictionary *categoryDict = [entryDict objectForKey:@"category"];
                    if ([categoryDict isKindOfClass:[NSDictionary class]])
                    {
                        NSDictionary *attributes = [categoryDict objectForKey:@"attributes"];
                        if ([attributes isKindOfClass:[NSDictionary class]])
                        {
                            NSString *type = [attributes objectForKey:@"label"];
                            if ([type isKindOfClass:[NSString class]])
                            {
                                entry.type = type;
                            }
                        }
                    }
                    [parserEntrys addObject:entry];
                }
            }
            
        }
        
    }
    
    if (finished) {
        finished(parserEntrys, error);
    }
}

- (void)parserXMLData:(NSData *)data finished:(ParserDataFinished)finished
{
    if (data.length <= 0) return;
    // 记录Block
    self.xmlParserBlock = finished;
    
    self.xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    self.xmlParser.delegate = self;
    // 开始
    [self.xmlParser parse];
    
}


#pragma mark - NSXMLParserDelegate
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.entrys = [NSMutableArray array];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // 每遇到一个新的entry，就创建一个新的entry模型
    if ([elementName isEqualToString:@"entry"]) {
        [self.entrys addObject:[[ZOPEntry alloc] init]];
    }
    
    if (self.entrys.count > 0) {
        ZOPEntry *entry = [self.entrys lastObject];
        if ([elementName isEqualToString:@"category"] && entry.type == nil) {
            entry.type = attributeDict[@"label"];
        }
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // 找到字段
    if (_stringM == nil) {
        _stringM = [[NSMutableString alloc] init];
    }
    if (string && string.length > 0) {
        // 去掉前后空格和回车符
        NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        [_stringM appendString:trimmedString];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (self.entrys.count > 0) {
        ZOPEntry *entry = [self.entrys lastObject];
        if ([elementName isEqualToString:@"im:name"] && entry.name == nil) {
            entry.name = [_stringM copy];
        }
        
        if ([elementName isEqualToString:@"im:image"] && entry.imageURL == nil) {
            entry.imageURL = [_stringM copy];
        }
        
        if ([elementName isEqualToString:@"summary"] && entry.summary == nil) {
            entry.summary = [_stringM copy];
        }
        
        if ([elementName isEqualToString:@"im:price"] && entry.price == nil) {
            entry.price = [_stringM copy];
        }
    }
    // 清空字符串容器
    _stringM = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    // 回调Block
    if (self.entrys.count > 0) {
        if (self.xmlParserBlock) {
            self.xmlParserBlock([self.entrys copy], nil);
        }
    }
    else
    {
        if (self.xmlParserBlock) {
            
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey : @"xml解析出错"};
            NSError *error = [NSError errorWithDomain:@"解析出错" code:0 userInfo:userInfo];
            
            self.xmlParserBlock(nil, error);
        }
    }
    
    // 清空Block
    self.xmlParserBlock = nil;
    self.entrys = nil;
}

- (void)dealloc
{
    NSLog(@"parserData dealloc");
    self.xmlParser = nil;
}

@end
