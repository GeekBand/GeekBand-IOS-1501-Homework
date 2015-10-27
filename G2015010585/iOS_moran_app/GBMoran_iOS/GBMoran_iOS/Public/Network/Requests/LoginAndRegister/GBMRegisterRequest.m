//
//  GBMRegisterRequest.m
//  GBMoran_iOS
//
//  Created by ZhangBob on 10/18/15.
//  Copyright (c) 2015 JixinZhang. All rights reserved.
//

#import "GBMRegisterRequest.h"
#import "BLMultipartForm.h"
#import "GBMRegisterRequestParser.h"

@implementation GBMRegisterRequest


#pragma mark - 建立连接并且用第三方库BLMultipartForm封装
- (void)sendRegisterRequestWithUserName:(NSString *)userName
                                  email:(NSString *)email
                               password:(NSString *)password
                                   gbid:(NSString *)gbid
                               delegate:(id<GBMRegisterRequestDelegate>)delegate
{
    [self.urlConnection cancel];
    self.delegate = delegate;
    
    NSString *urlString = @"http://moran.chinacloudapp.cn/moran/web/user/register";
    
    //POST请求
    NSString *encodeURLString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodeURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    
    BLMultipartForm *form = [[BLMultipartForm alloc] init];
    [form addValue:userName forField:@"username"];
    [form addValue:email forField:@"email"];
    [form addValue:password forField:@"password"];
    [form addValue:gbid forField:@"gbid"];
    request.HTTPBody = [form httpBody];
    [request setValue:form.contentType forHTTPHeaderField:@"Content-Type"];
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
}

#pragma mark - 实现NSURLConnectionDataDelegate代理

//收到响应，网络代码为200，则请求成功。初始化NSMutableData对象
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {
        self.receivcedData = [NSMutableData data];
    }
}

//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivcedData appendData:data];
}

//连接完成，解析数据
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:self.receivcedData encoding:NSUTF8StringEncoding];
    NSLog(@"receive data string : %@",string);
    
    GBMRegisterRequestParser *parser = [[GBMRegisterRequestParser alloc] init];
    GBMUserModel *user = [parser parseJson:self.receivcedData];
    
    if ([_delegate respondsToSelector:@selector(registerRequestSuccess:user:)]) {
        [_delegate registerRequestSuccess:self user:user];
    }
}

//连接失败，打印出错误.若代理实现了registerRequestFailed:error：方法，则调用registerRequestFailed:error:方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@",error);
    if ([_delegate respondsToSelector:@selector(registerRequestFailed:error:)]) {
        [_delegate registerRequestFailed:self error:error];
    }
}











@end
