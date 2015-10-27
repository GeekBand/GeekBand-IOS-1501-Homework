//
//  GBMReNameRequest.h
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/24/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GBMReNameRequest;

@protocol GBMReNameRequestDelegate <NSObject>

- (void)renameRequestSuccess:(GBMReNameRequest *)request ;
- (void)renameRequestFail:(GBMReNameRequest *)request error:(NSError *)error;

@end

@interface GBMReNameRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <GBMReNameRequestDelegate> delegate;

- (void)sendReNameRequestWithName:(NSString *)name
                         delegate:(id <GBMReNameRequestDelegate>)delegate;



@end