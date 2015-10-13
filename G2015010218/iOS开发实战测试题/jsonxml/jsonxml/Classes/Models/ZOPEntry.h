//
//  ZOPEntry.h
//  jsonxml
//
//  Created by 黄纪银163 on 15/8/31.
//  Copyright (c) 2015年 Zerone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZOPEntry : NSObject
/** im:name */
@property (nonatomic, copy) NSString *name;
/** 图片 */
@property (nonatomic, copy) NSString *imageURL;
/** 文字描述 */
@property (nonatomic, copy) NSString *summary;
/** 价格 */
@property (nonatomic, copy) NSString *price;
/** 类型 */
@property (nonatomic, copy) NSString *type;

@end
