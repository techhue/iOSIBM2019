//
//  RCCenterView.m
//  UIResponderChain
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "RCCenterView.h"

@interface RCCenterView()

- (void)handleSingleTapGesture:(UITapGestureRecognizer*)recognizer;

@end

@implementation RCCenterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(handleSingleTapGesture:)];
        [singleTap setNumberOfTapsRequired:1];
        [singleTap setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:singleTap];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)handleSingleTapGesture:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"Single Tap: %@", self);
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Single Tap"
                                                        message:@"Center View Single Tap Gesture"
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch Begin: %@", self);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch Moved: %@", self);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch Ended: %@", self);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch Cancelled: %@", self);
}

@end