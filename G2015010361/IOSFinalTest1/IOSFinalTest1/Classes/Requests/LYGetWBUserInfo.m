//
//  LYGetWBUserInfo.m
//  IOSFinalTest1
//
//  Created by 雷源 on 15/10/11.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYGetWBUserInfo.h"
#import "BLMultipartForm.h"
//#import "BLLoginRequestParser.h"

@interface LYGetWBUserInfo()<NSURLConnectionDataDelegate>

@end

@implementation LYGetWBUserInfo

- (void)sendLoginRequestWithUserName:(NSString *)userName
                            delegate:(id<LYGetWBUserInfoDelegate>)delegate
{
    [self.URLConnection cancel];
    
    
    self.delegate = delegate;
    NSString *URLString = @"https://api.weibo.com/2/friendships/followers.json";
    
        // GET  eg, http://xxxx.com/login.json?username=zhangsan&password=123456
        URLString = [NSString stringWithFormat:@"%@?username=%@", URLString, userName];
        NSString *encodedURLString
        = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *URL = [NSURL URLWithString:encodedURLString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
        request.HTTPMethod = @"GET";
        request.timeoutInterval = 60;
        request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
        self.URLConnection = [[NSURLConnection alloc] initWithRequest:request
                                                             delegate:self
                                                     startImmediately:YES];
    

    
}

//- (void)start
//{
//    [self.URLConnection start];
//}

- (void)cancelRequest
{
    if (self.URLConnection) {
        [self.URLConnection cancel];
        self.URLConnection = nil;
    }
}

#pragma mark - NSURLConnectionDataDelegate methods

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {   // 连接成功
        self.receivedData = [NSMutableData data];
    }else {
        // 请求错误，错误处理。
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:self.receivedData
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"%@", string);
    
//    BLLoginRequestParser *parser = [[BLLoginRequestParser alloc] init];
//    BLUser *user = [parser parseXML:self.receivedData];
//    if ([_delegate respondsToSelector:@selector(requestSuccess:user:)]) {
//        [_delegate requestSuccess:self user:user];
//   }
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    if ([_delegate respondsToSelector:@selector(requestFailed:error:)]) {
        [_delegate requestFailed:self error:error];
    }
}

@end
