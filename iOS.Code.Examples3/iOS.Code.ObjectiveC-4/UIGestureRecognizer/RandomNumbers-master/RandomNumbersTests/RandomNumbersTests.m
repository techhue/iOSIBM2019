//
//  RandomNumbersTests.m
//  RandomNumbersTests
//
//  Created by Ravi Shankar on 29/04/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RandomNumber.h"

@interface RandomNumbersTests : XCTestCase

@end

@implementation RandomNumbersTests
{
    RandomNumber *randomNumber;
}

- (void)setUp
{
    [super setUp];
    randomNumber = [[RandomNumber alloc] init];
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testIfRandomNumberClassExists {
    XCTAssertNotNil(randomNumber, @"RandomNumber class exists");
}

-(void)testGenerateNumber {
    XCTAssert([randomNumber generateNumber] > 0, @"Generate retruns a number");
}
@end
