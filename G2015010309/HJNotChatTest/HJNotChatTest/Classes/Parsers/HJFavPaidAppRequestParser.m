//
//  HJFavPaidAppRequestParser.m
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJFavPaidAppRequestParser.h"
#import "HJAppImage.h"

@implementation HJFavPaidAppRequestParser

#pragma mark - NSXMLParserDelegate methods

//开始节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    [_currentValue setString:@""];

    if ([elementName isEqualToString:@"feed"]) {
        _appArray = [[NSMutableArray alloc] init];
        _currentAppInfo = nil;
    } else if ([elementName isEqualToString:@"entry"]) {
        _currentAppInfo = [[HJAppInfo alloc] init];
        _currentImgArray = [[NSMutableArray alloc] init];
    }
}

//闭合节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    if (_currentAppInfo) {
        if ([elementName isEqualToString:@"title"]) {
            _currentAppInfo.appName = _currentValue;
        } else if ([elementName isEqualToString:@"summary"]) {
            _currentAppInfo.summary = _currentValue;
        } else if ([elementName isEqualToString:@"im:artist"]) {
            _currentAppInfo.artist = _currentValue;
        } else if ([elementName isEqualToString:@"im:price"]) {
            _currentAppInfo.price = _currentValue;
        } else if ([elementName isEqualToString:@"im:image"]) {
            HJAppImage *appImg = [[HJAppImage alloc] init];
            appImg.imageUrl = _currentValue;
            [_currentImgArray addObject:appImg];
        } else if ([elementName isEqualToString:@"rights"]) {
            _currentAppInfo.right = _currentValue;
        } else if ([elementName isEqualToString:@"id"]) {
            _currentAppInfo.appLink = _currentValue;
        } else if ([elementName isEqualToString:@"im:releaseDate"]) {
            _currentAppInfo.releaseDate = _currentValue;
            _currentAppInfo.imageArray = _currentImgArray;
            [_appArray addObject:_currentAppInfo];
        }
        
        else if ([elementName isEqualToString:@"feed"]) {
            NSLog(@"%@", _currentAppInfo);
        }
    }
}

//数据
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (_currentValue) {
        [_currentValue appendString:string];
    } else {
        [_currentValue setString:string];
    }
}

#pragma mark - Custom methods

- (NSArray *)parseXML:(NSData *)data {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    NSError *error = [parser parserError];
    if (error) {
        NSLog(@"error ----> %@", error);
    } else {
        _currentValue = [[NSMutableString alloc] init];
        _appArray = [[NSMutableArray alloc] init];
        parser.delegate = self;
        [parser parse];
        return _appArray;
    }
    
    return nil;
}

#pragma mark - Parse json
// JSON 数据解析
- (NSArray *)parsrJson:(NSData *)data {
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        // error methods
        NSLog(@"error");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id feedDic = [jsonDic valueForKey:@"feed"];
            if ([[feedDic class] isSubclassOfClass:[NSDictionary class]]) {
                id entryArray = [feedDic valueForKey:@"entry"];
                if ([[entryArray class] isSubclassOfClass:[NSArray class]]) {
                    NSMutableArray *appInfoArray = [[NSMutableArray alloc] init];
                    
                    for (NSInteger appCount = 0; appCount < [entryArray count]; appCount++) {
                        HJAppInfo *appInfo = [[HJAppInfo alloc] init];
                        
                        id appDic = [(NSArray *)entryArray objectAtIndex:appCount];
                        if ([[appDic class] isSubclassOfClass:[NSDictionary class]]) {
                            //get appName
                            id nameDic = [(NSDictionary *)appDic valueForKey:@"im:name"];
                            if ([[nameDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id appName = [nameDic valueForKey:@"label"];
                                if ([[appName class] isSubclassOfClass:[NSString class]]) {
                                    appInfo.appName = appName;
                                }
                            }
                        
                             //get imageUrlArray
                            id imageArray = [(NSDictionary *)appDic valueForKey:@"im:image"];
                            if ([[imageArray class] isSubclassOfClass:[NSArray class]]) {
                                NSMutableArray *imgArray = [[NSMutableArray alloc] initWithCapacity:[(NSArray *)imageArray count]];
                                for (NSInteger imgCount = 0; imgCount < [(NSMutableArray *)imageArray count]; imgCount++) {
                                    HJAppImage *appImg = [[HJAppImage alloc] init];
                                    id imgResDic = [(NSArray *)imageArray objectAtIndex:imgCount];
                                    if ([[imgResDic class] isSubclassOfClass:[NSDictionary class]]) {
                                        appImg.imageUrl = [(NSDictionary *)imgResDic valueForKey:@"label"];
                                        id imgAttr = [(NSDictionary *)imgResDic valueForKey:@"attributes"];
                                        if ([[imgAttr class] isSubclassOfClass:[NSDictionary class]]) {
                                            NSString *heightString = [(NSDictionary *)imgAttr valueForKey:@"height"];
                                            appImg.height = [heightString integerValue];
//                                            NSLog(@"heightString: %@", heightString);
                                        }
                                    }
//                                    NSLog(@"imgDic: %@", imgDic);
                                    [imgArray addObject:appImg];
                                }
                                appInfo.imageArray = imgArray;
//                                for (NSInteger i = 0; i < [appInfo.imageArray count]; i++) {
//                                    NSDictionary *dic = [appInfo.imageArray objectAtIndex:i];
////                                    NSLog(@"key: url, value:%@", [dic valueForKey:@"url"]);
////                                    NSLog(@"key: height, value: %@", [dic valueForKey:@"height"]);
//                                }
                            }
                            
                            //price
                            id priceDic = [(NSDictionary *)appDic valueForKey:@"im:price"];
                            if ([[priceDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id price = [priceDic valueForKey:@"label"];
                                if ([[price class] isSubclassOfClass:[NSString class]]) {
                                    appInfo.price = price;
                                }
                            }
                            
                            //artist
                            id artistDic = [(NSDictionary *)appDic valueForKey:@"im:artist"];
                            if ([[artistDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id artist = [artistDic valueForKey:@"label"];
                                if ([[artist class] isSubclassOfClass:[NSString class]]) {
                                    appInfo.artist = artist;
                                }
                            }
                            
                            //summary
                            id summaryDic = [(NSDictionary *)appDic valueForKey:@"summary"];
                            if ([[summaryDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id summary = [summaryDic valueForKey:@"label"];
                                if ([[summary class] isSubclassOfClass:[NSString class]]) {
                                    appInfo.summary = summary;
                                }
                            }
                            
                            //rights
                            id rightDic = [(NSDictionary *)appDic valueForKey:@"rights"];
                            if ([[rightDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id right = [rightDic valueForKey:@"label"];
                                if ([[right class] isSubclassOfClass:[NSString class]]) {
                                    appInfo.right = right;
                                }
                            }
                            
                            //appLink
                            id attributesDic = [(NSDictionary *)appDic valueForKey:@"link"];
                            if ([[attributesDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id linkDic = [(NSDictionary *)attributesDic valueForKey:@"attributes"];
                                if ([[linkDic class] isSubclassOfClass:[NSDictionary class]]) {
                                    id link = [linkDic valueForKey:@"href"];
                                    if ([[link class] isSubclassOfClass:[NSString class]]) {
                                        appInfo.appLink = link;
                                    }
                                }
                            }
                            
                            //bundleID
                            id idDic = [(NSDictionary *)appDic valueForKey:@"id"];
                            if ([[idDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id attrDic = [(NSDictionary *)idDic valueForKey:@"attributes"];
                                if ([[attrDic class] isSubclassOfClass:[NSDictionary class]]) {
                                    id bundleID = [attrDic valueForKey:@"im:bundleId"];
                                    if ([[bundleID class] isSubclassOfClass:[NSString class]]) {
                                        appInfo.bundleID = bundleID;
                                    }
                                }
                            }
                            
                            //release date
                            id releaseDateDic = [(NSDictionary *)appDic valueForKey:@"im:releaseDate"];
                            if ([[releaseDateDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id releaseAttrDic = [releaseDateDic valueForKey:@"attributes"];
                                if ([[releaseAttrDic class] isSubclassOfClass:[NSDictionary class]]) {
                                    NSString *releaseDate = [releaseAttrDic valueForKey:@"label"];
                                    appInfo.releaseDate = releaseDate;
                                }
                            }
                            
                            //app type
                            id categoryDic = [(NSDictionary *)appDic valueForKey:@"category"];
                            if ([[categoryDic class] isSubclassOfClass:[NSDictionary class]]) {
                                id typeAttrDic = [(NSDictionary *)categoryDic valueForKey:@"attributes"];
                                if ([[typeAttrDic class] isSubclassOfClass:[NSDictionary class]]) {
                                    id type = [typeAttrDic valueForKey:@"label"];
                                    if ([[type class] isSubclassOfClass:[NSString class]]) {
                                        appInfo.appType = type;
                                    }
                                }
                            }
                        }
      
                        [appInfoArray addObject:appInfo];
                    }
                    
                    return appInfoArray;
                }
            }
        }
    }
    
    return nil;
}

@end
