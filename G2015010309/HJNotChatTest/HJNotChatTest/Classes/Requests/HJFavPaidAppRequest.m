//
//  HJFavPaidAppRequest.m
//  HJNotChatTest
//
//  Created by HeJay on 8/30/15.
//  Copyright (c) 2015 Long. All rights reserved.
//

#import "HJFavPaidAppRequest.h"
#import "HJFavPaidAppRequestParser.h"

@implementation HJFavPaidAppRequest

- (void)requestForPaidAppJson: (BOOL)isJson {
    NSString *urlString = @"";
    if (isJson) {
        urlString = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/json";
    } else {
        urlString = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=10/xml";
    }

    NSString *encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *URL = [NSURL URLWithString:encodedString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.HTTPMethod = @"GET";
    request.timeoutInterval = 60;
    request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    self.URLConnection = [[NSURLConnection alloc] initWithRequest:request
                                                         delegate:self
                                                 startImmediately:YES];
}

- (void)cancelRequest {
    if (self.URLConnection){
        [self.URLConnection cancel];
        self.URLConnection = nil;
    }
}

#pragma mark - NSURLConnectionDataDelegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode == 200) {
        self.receivedData = [NSMutableData data];
    } else {
        NSLog(@"error code: %li.", httpResponse.statusCode);
        [self cancelRequest];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //Parse
    NSLog(@"data length : %li", [_receivedData length]);
    HJFavPaidAppRequestParser *parser = [[HJFavPaidAppRequestParser alloc] init];
    NSDate  *startDate = [NSDate date];
    NSArray *appInfoArray = [[NSArray alloc] init];
    if (self.isJson) {
        appInfoArray = [parser parsrJson:_receivedData];
    } else {
        appInfoArray = [parser parseXML:_receivedData];
    }
    
    double deltaTime = [[NSDate date] timeIntervalSinceDate:startDate];
    NSLog(@"%f", deltaTime);
    if (self.isJson) {
        [_delegate setJsonParseTime:deltaTime];
    } else {
        [_delegate setXmlParseTime:deltaTime];
    }
    [_delegate requestSuccess:appInfoArray];
//    for (NSInteger appCount = 0; appCount < [appInfoArray count]; appCount++) {
//        id appInfo = [appInfoArray objectAtIndex:appCount];
//        if ([[appInfo class] isSubclassOfClass:[HJAppInfo class]]) {
//            NSLog(@"name: %@", ((HJAppInfo *)appInfo).appName);
//            NSArray *imgArray = ((HJAppInfo *)appInfo).imageArray;
//            for (NSInteger imgCount = 0; imgCount < [imgArray count]; imgCount++) {
//                NSDictionary *imgDic = [imgArray objectAtIndex:imgCount];
//                NSLog(@"img %li, url: %@, height: %@", imgCount, [imgDic valueForKey:@"url"], [imgDic valueForKey:@"height"]);
//            }
//        }
//    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"error ---> %@", error);
}

@end
