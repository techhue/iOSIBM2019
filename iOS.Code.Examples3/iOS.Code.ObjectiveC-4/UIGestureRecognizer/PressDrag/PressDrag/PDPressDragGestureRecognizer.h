//
//  PDPressDragGestureRecognizer .h
//  PressDrag
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface PDPressDragGestureRecognizer  : UIGestureRecognizer

@property (nonatomic) CGPoint anchorPoint;
@property (nonatomic) CGPoint dragPoint;

@property (nonatomic) CGFloat allowableMovement;
@property (nonatomic) CFTimeInterval minimumPressDuration;

- (void)reset;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
