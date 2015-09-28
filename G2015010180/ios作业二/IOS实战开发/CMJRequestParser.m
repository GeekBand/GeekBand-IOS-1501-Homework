
//
//  CMJRequestParser.m
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/27.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//
#import "CMJUser.h"
#import "CMJRequestParser.h"
#import "CMJName.h"
#import "CMJImage.h"
#import "CMJSummary.h"
#import "CMJPrice.h"

@implementation CMJRequestParser



- (CMJUser *)parseJson:(NSData *)data
{
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        // 解析出错。
    }else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            
            id userDic = [jsonDic valueForKey:@"feed"];
            id userDic2 = [userDic valueForKey:@"entry"];
            if ([[userDic class] isSubclassOfClass:[NSDictionary class]]) {
                if ([[userDic2 class] isSubclassOfClass:[NSArray class]]) {
                
                CMJUser *user = [[CMJUser alloc] init];
                
                id imNameDic = [userDic2 valueForKey:@"im:name"];
                if ([[imNameDic class] isSubclassOfClass:[NSArray class]]) {
                     CMJName *name = [[CMJName alloc] init];
                    
                    id label = [imNameDic valueForKey:@"label"];
                    if ([[label class] isSubclassOfClass:[NSArray class]]) {
                        name.label = label;
                    }
                    user.imName = name;
                }
                
                    
                    
                id imgDic = [userDic2 valueForKey:@"im:image"];
                if ([[imgDic class] isSubclassOfClass:[NSArray class]]) {
                    CMJImage *image = [[CMJImage alloc]init];
                    id label = [imgDic valueForKey:@"label"];
                    if ([[label class] isSubclassOfClass:[NSArray class]]) {
                        image.label = label;
                    }
                    id attributes = [imgDic valueForKey:@"attributes"];
                    if ([[attributes class] isSubclassOfClass:[NSArray class]]) {
                        image.attributes = attributes;
                    }
                    user.img = image;
                }
                    

                id summaryDic = [userDic2 valueForKey:@"summary"];
                if ([[summaryDic class] isSubclassOfClass:[NSArray class]]) {
                    CMJSummary *summary = [[CMJSummary alloc]init];
                    id label = [summaryDic valueForKey:@"label"];
                    if ([[label class] isSubclassOfClass:[NSArray class]]) {
                        summary.label = label;
                    }
                    user.summary = summary;
                }
                
                id PriceDic = [userDic2 valueForKey:@"im:price"];
                    if ([[PriceDic class] isSubclassOfClass:[NSArray class]]) {
                        CMJPrice *price = [[CMJPrice alloc]init];
                        id label = [PriceDic valueForKey:@"label"];
                        if ([[label class] isSubclassOfClass:[NSArray class]]) {
                            price.label = label;
                        }
                        user.imPrice = price;
                    }

         
                
                return user;
            }
        }
    }
    }
    return nil;
}


@end
