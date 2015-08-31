//
//  CMJUser.h
//  IOS实战开发
//
//  Created by 陈铭嘉 on 15/8/27.
//  Copyright © 2015年 陈铭嘉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMJName.h"
#import "CMJImage.h"
#import "CMJSummary.h"
#import "CMJPrice.h"

@interface CMJUser : NSObject

@property(nonatomic, strong)CMJName *imName;
@property(nonatomic, strong)CMJImage *img;

@property(nonatomic, strong)CMJSummary *summary;
@property(nonatomic, strong)CMJPrice *imPrice;
@property(nonatomic, copy)NSString *imContentType;
@property(nonatomic, copy)NSString *right;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *link;
@property(nonatomic, copy)NSString *imid;
@property(nonatomic, copy)NSString *imArtist;
@property(nonatomic, copy)NSString *category;
@property(nonatomic, copy)NSString *imReleaseData;




@end
