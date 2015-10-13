//
//  MyParser.m
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/28.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import "MyParser.h"
#import "MyCellModel.h"

@implementation MyParser

+ (NSMutableArray *)parseWithArray:(NSArray *)array {
    
    NSMutableArray * rArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary * obj in array) {
        
        NSDictionary * dic = obj;
//        NSLog(@"%i", [obj isKindOfClass:[NSDictionary class]]);
//        NSLog(@"%@", dic);
        
        MyCellModel * cell = [[MyCellModel alloc] init];
        cell.appNameText = (NSString *)[dic valueForKeyPath:@"im:name.label"];
        cell.appSummaryText = (NSString *)[dic valueForKeyPath:@"summary.label"];
        cell.priceText = (NSString *)[dic valueForKeyPath:@"im:price.label"];
        cell.categoryText = (NSString *)[dic valueForKeyPath:@"category.attributes.label"];
        cell.releaseTimeText = (NSString *)[dic valueForKeyPath:@"im:releaseDate.attributes.label"];
        cell.companyText = (NSString *)[dic valueForKeyPath:@"rights.label"];
        cell.imageUrl = (NSString * )([[[dic valueForKey:@"im:image"] objectAtIndex:0] valueForKey:@"label"]);
        
//        NSLog(@"%@", (NSString *)[dic valueForKeyPath:@"im:name.label"]);
        
//        NSLog(@"%@", cell.appNameText);
//        NSLog(@"I'm OK!");
        
        
        
        CGRect rect = [cell.appSummaryText boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 20, 3000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        cell.summaryHeight = rect.size.height;
        
//        CGRect labelFrame = cell.appSummary.frame;
//        labelFrame.size.height = rect.size.height;
//        cell.appSummary.frame = labelFrame;
        
        
        
//        NSLog(@"%lu", (unsigned long)idx);
        
        [rArray addObject:cell];
        
    }
    
    return rArray;
}

@end
