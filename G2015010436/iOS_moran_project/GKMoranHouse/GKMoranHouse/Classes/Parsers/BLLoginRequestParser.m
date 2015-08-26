//
//  BLLoginRequestParser.m
//  Xcode_learn
//
//  Created by house on 15/8/15.
//  Copyright © 2015年 putact. All rights reserved.
//

#import "BLLoginRequestParser.h"

@implementation BLLoginRequestParser 
-(LUser *)parserXML:(NSData *)data{
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    
    NSError *error =[parser parserError];
    if (error) {
        
    }else{
        _user = [[LUser alloc]init];
        _currentValue =[NSMutableString string];
         parser.delegate = self;
        [parser parse];
        return  _user;
    }
    return  nil;
}


#pragma remark ----NSXMLParserDelegate methods;

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    [_currentValue setString:@""];
    if ([elementName isEqualToString:@"address"]) {
        _address =[[LAddress alloc]init];
    }
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    [_currentValue setString:string];
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"userName"]) {
        _user.userName = _currentValue;
    }else if ([elementName isEqualToString:@"age"]){
        _user.age = [_currentValue integerValue];
    }else if ([elementName isEqualToString:@"headImageUrl"]){
        _user.headImageUrl = _currentValue;
    }else if ([elementName isEqualToString:@"city"]){
        _address.city = _currentValue;
    }else if ([elementName isEqualToString:@"id"]){
        if (_address) {
            _address.cityId =_currentValue;
        }else {
            _user.userId = _currentValue;
        }
    }
}
-(LUser *)parserJson:(NSData *)data{
    
    NSError *errer = nil;
    
    id jsonDic= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&errer];
    if (errer) {
        
    }else{
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id userDic = [jsonDic objectForKey:@"user"];
            if ([[userDic class]isSubclassOfClass:[NSDictionary class]]) {
                LUser *user = [[LUser alloc]init];
                id userName = [userDic objectForKey:@"userName"];
                if ([[userName class]isSubclassOfClass:[NSString class]]) {
                    user.userName = userName;
                }
                
                id uId = [userDic objectForKey:@"id"];
                if ([[uId class]isSubclassOfClass:[NSString class]]) {
                    user.userId = uId;
                }else if([[uId class]isSubclassOfClass:[NSNumber class]]){
                    user.userId = [uId stringValue];
                
                }
                
                id age = [userDic objectForKey:@"age"];
                if ([[age class]isSubclassOfClass:[NSNumber class]]) {
                    user.age = [age integerValue];
                }
                
                id headImageUrl = [userDic objectForKey:@"headImageUrl"];
                if ([[headImageUrl class]isSubclassOfClass:[NSString class]]) {
                    user.headImageUrl = headImageUrl;
                }
                
                id addressDic = [userDic objectForKey:@"address"];
                if ([[addressDic class] isSubclassOfClass:[NSDictionary class]]) {
                    LAddress *address = [[LAddress alloc]init];
                    
                    id aId = [addressDic objectForKey:@"id"];
                    
                      if ([[aId class]isSubclassOfClass:[NSString class]]) {
                          address.cityId = aId;
                    }else if([[aId class]isSubclassOfClass:[NSNumber class]]){
                        address.cityId = [aId stringValue];
                    }
                    
                    id city = [addressDic valueForKey:@"city"];
                    if ([[city class] isSubclassOfClass:[NSString class]]) {
                        address.city = city;
                    }
                
                    user.address = address;
                }
                return  user;
            }
        }
    
    
    }
    
    return  nil;
}
@end
