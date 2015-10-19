//
//  GBMGetImage.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/18.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMUserModel.h"


@interface GBMGetImage : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;

- (void)sendGetImageRequest;

@end
