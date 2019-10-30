//
//  RCRightView.m
//  UIResponderChain
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "RCRightView.h"

@interface RCRightView()

- (void)handleDoubleTapGesture:(UITapGestureRecognizer*)recognizer;

@end

@implementation RCRightView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(handleDoubleTapGesture:)];
        [doubleTap setNumberOfTapsRequired:2];
        [doubleTap setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:doubleTap];
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

- (void)handleDoubleTapGesture:(UITapGestureRecognizer *)recognizer
{
    NSLog( @" Double Gesture: %@ ", self);
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Double Tap"
                                                        message:@"Right View Double Tap Gesture"
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
