//
//  EHScratchPadView.h
//  EventHandling1
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum {
	EHScratchPadToolTypePaint = 0,
	EHScratchPadToolTypeAirBrush
} EHScratchPadToolType;

@interface EHScratchPadView : UIControl

@property (assign) EHScratchPadToolType toolType;
@property (strong,nonatomic) UIColor* drawColor;
@property (assign) CGFloat drawWidth;
@property (assign) CGFloat drawOpacity;
@property (assign) CGFloat airBrushFlow;

- (void) clearToColor:(UIColor*)color;

- (UIImage*) getSketch;
- (void) setSketch:(UIImage*)sketch;

@end
