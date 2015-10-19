//
//  LYTest2Request2.m
//  IOSHomeWork2
//
//  Created by 雷源 on 15/10/17.
//  Copyright (c) 2015年 LEIYuan. All rights reserved.
//

#import "LYTest2Request2.h"

@implementation LYTest2Request2
- (void)sendLoginRequestWithDelegate:(id<LYTest2Request2Delegate>)delegate
{
    [self.URLConnection cancel];
    
    
    self.delegate = delegate;
    NSString *URLString = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/xml";
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
  //  NSString *string = [[NSString alloc] initWithData:self.receivedData
   //                                          encoding:NSUTF8StringEncoding];
   // NSError *error;
//    NSLog(@"the url string%@", string);
// NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:self.receivedData  options:NSJSONReadingMutableLeaves error:&error];
    
//    NSLog(@"the paser string%@",jsonData);
   // self.receiveDic = jsonData;
    [self requestSuccess2:self];
    //    BLLoginRequestParser *parser = [[BLLoginRequestParser alloc] init];
    //    //    BLUser *user = [parser parseJson:self.receivedData];
    //    BLUser *user = [parser parseXML:self.receivedData];
    //    if ([_delegate respondsToSelector:@selector(requestSuccess:user:)]) {
    //        [_delegate requestSuccess:self user:user];
    //    }
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
    if ([_delegate respondsToSelector:@selector(requestFailed2:error:)]) {
        [_delegate requestFailed2:self error:error];
    }
}

- (void)requestSuccess2:(LYTest2Request2 *)request{
    
    
    if ([_delegate respondsToSelector:@selector(requestSuccess2:)]) {
        [_delegate requestSuccess2:self];//调用代理方法，第三步，把自己传过去
    }
}

@end