//
//  GBMSquareRequest.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/25/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMSquareRequest.h"
#import "GBMSquareRequestParser.h"
@implementation GBMSquareRequest

- (void)sendSquareRequestWithParameter:(NSDictionary *)paramDic delegate:(id<GBMSquareRequestDelegate>)delegate
{
    [self.urlConnection cancel];
    
    self.delegate = delegate;
    
    NSString *urlString = [NSString stringWithFormat:@"http://moran.chinacloudapp.cn/moran/web/node/list?distance=%@&latitude=%@&longitude=%@&token=%@&user_id=%@", paramDic[@"distance"], paramDic[@"latitude"], paramDic[@"longitude"], paramDic[@"token"], paramDic[@"user_id"]];
    // POST请求
    NSString *encodeURLString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:encodeURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData; // 忽略本地和远程的缓存
    
    
    
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
}

#pragma mark - 网络请求代理方法

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {
        self.receivedData = [NSMutableData data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"Square receive data string:%@", string);
    
    GBMSquareRequestParser *parser = [[GBMSquareRequestParser alloc] init];
    if ([_delegate respondsToSelector:@selector(squareRequestSuccess:dictionary:)]) {
        [_delegate squareRequestSuccess:self dictionary:[parser parseJson:self.receivedData]];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@", error);
    if ([_delegate respondsToSelector:@selector(squareRequestFailed:error:)]) {
        [_delegate squareRequestFailed:self error:error];
    }
}

@end
