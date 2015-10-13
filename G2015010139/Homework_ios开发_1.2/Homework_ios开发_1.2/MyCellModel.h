//
//  MyCellModel.h
//  Homework_ios开发_1.2
//
//  Created by john on 15/9/29.
//  Copyright © 2015年 geekband-i150027. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCellModel : NSObject

@property (nonatomic, copy) NSString * imageUrl;
@property (nonatomic, copy) NSString * appNameText;
@property (nonatomic, copy) NSString * appSummaryText;
@property (nonatomic, copy) NSString * priceText;
@property (nonatomic, copy) NSString * categoryText;
@property (nonatomic, copy) NSString * releaseTimeText;
@property (nonatomic, copy) NSString * companyText;
@property (nonatomic, assign) CGFloat summaryHeight;

@end
