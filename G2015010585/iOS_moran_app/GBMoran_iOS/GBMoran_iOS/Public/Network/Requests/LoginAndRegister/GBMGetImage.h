//
//  GBMGetImage.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"

@interface GBMGetImage : NSObject<NSURLConnectionDataDelegate>

@property (nonatomic,strong) NSURLConnection *urlConnection;
@property (nonatomic,strong) NSMutableData  *receivedData;

- (void)sendGetImageRequset;

@end
