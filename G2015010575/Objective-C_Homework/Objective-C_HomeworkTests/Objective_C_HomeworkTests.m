//
//  Objective_C_HomeworkTests.m
//  Objective-C_HomeworkTests
//
//  Created by 祝海焜 on 15/9/5.
//  Copyright (c) 2015年 祝海焜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Objective_C_HomeworkTests : XCTestCase

@end

@implementation Objective_C_HomeworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
