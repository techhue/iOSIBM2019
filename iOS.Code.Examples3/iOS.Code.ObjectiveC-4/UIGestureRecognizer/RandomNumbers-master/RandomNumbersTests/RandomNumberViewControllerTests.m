//
//  RandomNumberViewControllerTests.m
//  RandomNumbers
//
//  Created by Ravi Shankar on 29/04/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RSViewController.h"

@interface RandomNumberViewControllerTests : XCTestCase

@end

@implementation RandomNumberViewControllerTests
{
    RSViewController *viewController;
}

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewController = [storyboard instantiateViewControllerWithIdentifier:
                      @"RSViewController"];
    [viewController view];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testIfDisplayRandomNumberLabelExists {
    XCTAssertNotNil([viewController displayRandomNumber], @"displayRandomNumber label should be connected");
}

-(void)testMotionEventBeginLabelDisplaysZero {
    [viewController motionBegan:UIEventSubtypeMotionShake withEvent:nil];
    XCTAssertEqual([[viewController displayRandomNumber].text integerValue], 0, @"When the motion begin the value should be 0");
}

-(void)testMotionEventEndsLabelDisplaysRandomNumber {
    [viewController motionEnded:UIEventSubtypeMotionShake withEvent:nil];
    XCTAssert([[viewController displayRandomNumber].text integerValue] > 0, @"When motion end the value should be greater 0");
}

-(void)testTouchEventLabelDisplaysRandomNumber {
    [viewController touchesEnded:nil withEvent:nil];
    XCTAssert([[viewController displayRandomNumber].text integerValue] > 0, @"When touch event ends the value should be greater 0");
}

@end
