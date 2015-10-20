//
//  GBMReImageRequest.h
//  GBMoran_iOS
//
//  Created by ZHY on 15/10/16.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GBMReImageRequest;

@protocol GBMReImageRequestDelegate <NSObject>

- (void)reImageRequestSuccess:(GBMReImageRequest *)request ;
- (void)reImageRequestfail:(GBMReImageRequest *)request error:(NSError *)error;

@end

@interface GBMReImageRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <GBMReImageRequestDelegate> delegate;

- (void)sendReNameRequestWithImage:(UIImage *)image
                         delegate:(id <GBMReImageRequestDelegate>)delegate;



@end