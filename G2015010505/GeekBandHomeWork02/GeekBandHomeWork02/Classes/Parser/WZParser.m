//
//  WZParser.m
//  WZAFNetworkingTest
//
//  Created by Warren on 15/8/30.
//  Copyright (c) 2015年 Warren. All rights reserved.
//

#import "WZParser.h"

@interface WZParser ()<NSXMLParserDelegate>

//xml数据的容器
//@property (strong, nonatomic) NSMutableArray *wethers;

//拼接字符串
@property (strong, nonatomic) NSMutableString *elementString;

//模型
@property (strong, nonatomic) WZMessage *message;

//当前模型数据
@property (copy, nonatomic) NSString *currentValue;

@end

@implementation WZParser

- (WZMessage *)parserJson:(NSJSONSerialization *)json
{
    id jsonDictionary = json;
    
    if ([[jsonDictionary class] isSubclassOfClass:[NSDictionary class]]) {
        
        id modelDictionary = [jsonDictionary valueForKey:@"feed"];
        if ([[modelDictionary class] isSubclassOfClass:[NSDictionary class]]) {
            WZMessage *model = [[WZMessage alloc] init];
            
            id author = [modelDictionary valueForKey:@"author"];
            if ([[author class] isSubclassOfClass:[NSDictionary class]]) {
                
                id name = [author valueForKey:@"name"];
                if ([[name class] isSubclassOfClass:[NSDictionary class]]) {
                    
                    id label = [name valueForKey:@"label"];
                    if ([[label class] isSubclassOfClass:[NSString class]]) {
                      model.text = @"hello";
                      model.text = [model.text stringByAppendingString:label];
                        
                    }
                }
                id uri = [author valueForKey:@"uri"];
                if ([[uri class] isSubclassOfClass:[NSDictionary class]]) {
                    id uriLabel = [uri valueForKey:@"label"];
                    if ([[uriLabel class] isSubclassOfClass:[NSString class]]) {
                        
                      model.text = [model.text stringByAppendingString:uriLabel];
                        
                    }
                }
            }
            return model;
        }
    }
    
    
    return nil;
}

//-----------XML---------------

//- (NSMutableArray *)wethers
//{
//    if (!_wethers) {
//        _wethers = [[NSMutableArray alloc] init];
//    }
//    return _wethers;
//}

- (WZMessage *)message
{
    if (!_message) {
        _message = [[WZMessage alloc] init];
    }
    return _message;
}

- (NSMutableString *)elementString
{
    if (!_elementString) {
        _elementString = [[NSMutableString alloc] init];
    }
    return _elementString;
}

- (WZMessage *)parserXML:(NSXMLParser *)XMLParser
{
    //1.实力化一个xml解析器，通过代理实现xml解析
    
    //2.设置代理
    XMLParser.delegate = self;
    //3.解析器开始解析
    [XMLParser parse];
    
    
    return self.message;
}

#pragma mark - NSXMLParserDelegate

//1.打开文档，准备开始解析
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    //初始化数组容器，清空容器,便于多次加载数据
//    [self.wethers removeAllObjects];
}

//2.开始(打开)节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //如果开始节点的名称是city，就创建一个对象
    if ([elementName isEqualToString:@"city"]) {
        self.currentValue = [[NSMutableString alloc] init];
        self.currentValue = [attributeDict valueForKey:@"cityname"];
        if ([self.currentValue isEqualToString:@"海淀"]) {
            
//            self.currentValue = [self.currentValue stringByAppendingString:[attributeDict valueForKey:@"stateDetailed"]];
            self.message.text = [@"海淀" stringByAppendingString:[attributeDict valueForKey:@"stateDetailed"]];
        }
    }
}

//3.发现节点里的内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"节点内容－－－－－－%@", string);
}

//4.结束节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
//    self.message.text = self.currentValue;
    NSLog(@"%@", self.currentValue);
}

//5.结束（关闭）文档
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

@end
