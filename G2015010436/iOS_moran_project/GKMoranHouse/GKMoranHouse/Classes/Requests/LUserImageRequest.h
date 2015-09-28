//
//  LUserImageRequest.h
//  Xcode_learn
//
//  Created by house on 15/8/16.
//  Copyright © 2015年 putact. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LUserImageRequestDelegate;
@interface LUserImageRequest : NSObject <NSURLConnectionDataDelegate>
@property(nonatomic,strong)NSURLConnection *connection;
@property(nonatomic,strong)NSMutableData *receiveData;
@property(nonatomic,assign)id<LUserImageRequestDelegate>delegate;
@property(nonatomic ,assign)long long totalLength;
-(void)downLoadWithUrl:(NSString *)url delegate:(id<LUserImageRequestDelegate>)delagate;
@end


@protocol LUserImageRequestDelegate <NSObject>

-(void)downloadSuccess:(LUserImageRequest *)request data:(NSData *)data;
-(void)downloadError:(LUserImageRequest *) request
                   error:(NSError *)error;
- (void)downloadReceivedData:(LUserImageRequest *)downloader;


@end