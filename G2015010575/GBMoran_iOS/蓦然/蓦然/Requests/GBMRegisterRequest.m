//
//  GBMRegisterRequest.m
//  蓦然
//
//  Created by 祝海焜 on 15/10/19.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import "GBMRegisterRequest.h"
#import "BLMultipartForm.h"
#import "GBMRegisterRequestParser.h"

@implementation GBMRegisterRequest

//实现头文件中的方法。首先防止正在连接，先取消当前连接，然后设定代理为self。将发送请求的网址放在字符串中，用UTF8编码方式格式化字符串，再将已经被格式化的字符串初始化NSURL连接，最后将NSURL连接生成请求NSMutableURLRequest。NSMutableURLRequest的参数设置：方式以post方式，超时时间为60秒，忽视本地缓存。最后用第三方库BLMultipartform封装传递的参数生成请求。
- (void)sendRegisterRequestWithUserName:(NSString *)username
                                  email:(NSString *)email
                               password:(NSString *)password
                                   gbid:(NSString *)gbid
                               delegate:(id<GBMRegisterRequestDelegate>)delegate
{
    [self.urlConnection cancel];
    
    self.delegate = delegate;
    
    NSString *urlString = @"http://moran.chinacloudapp.cn/moran/web/user/register";
    
    // POST请求
    NSString *encodeURLString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:encodeURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData; // 忽略本地和远程的缓存
    
    BLMultipartForm *form = [[BLMultipartForm alloc] init];
    [form addValue:username forField:@"username"];
    [form addValue:email forField:@"email"];
    [form addValue:password forField:@"password"];
    [form addValue:gbid forField:@"gbid"];
    request.HTTPBody = [form httpBody];
    [request setValue:form.contentType forHTTPHeaderField:@"Content-Type"];
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
}

#pragma mark - 网络请求代理方法

//收到响应，若对应的网络码为200，说明请求成功，初始化NSMutableData对象
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {
        self.receivedData = [NSMutableData data];
    }
}

//接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

//连接完成后，首先将得到的数据用UTF8编码，将得到的字符串打印出。然后初始化GBMRegisterRequestParser，利用parseJson方法将数据解析，将返回的值赋予User.最后若当前代理有registerRequestSuccess:user:这个方法，则使用此方法传递参数。
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *string = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"Register receive data string:%@", string);
    
    GBMRegisterRequestParser *parser = [[GBMRegisterRequestParser alloc] init];
    GBMUserModel *user = [parser parseJson:self.receivedData];
    
    if ([_delegate respondsToSelector:@selector(registerRequestSuccess:user:)]) {
        [_delegate registerRequestSuccess:self user:user];
    }
}

//连接失败。打印出错误，若代理实现了registerRequestFailed:error:方法，则调用registerRequestFailed:error:方法。
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@", error);
    if ([_delegate respondsToSelector:@selector(registerRequestFailed:error:)]) {
        [_delegate registerRequestFailed:self error:error];
    }
}


@end
