//
//  GBMReNameRequest.h
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GBMReNameRequest;

@protocol GBMReNameRequestDelegate <NSObject>

- (void)renameRequestSuccess:(GBMReNameRequest *)request ;
- (void)renameRequestfail:(GBMReNameRequest *)request error:(NSError *)error;

@end

@interface GBMReNameRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <GBMReNameRequestDelegate> delegate;

- (void)sendReNameRequestWithName:(NSString *)name
                         delegate:(id <GBMReNameRequestDelegate>)delegate;



@end
