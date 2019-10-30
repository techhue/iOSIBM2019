//
//  CSVTraingleView.m
//  CustomShapeViews
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "CSVTraingleView.h"

@implementation CSVTraingleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (Class)layerClass
{
    return [CAShapeLayer class];
}

- (CAShapeLayer *)shapeLayer
{
    return (CAShapeLayer *)self.layer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)layoutSubviews
{
    CAShapeLayer *layer = [self shapeLayer];
    CGMutablePathRef trianglePath = CGPathCreateMutable();
    CGPathMoveToPoint(trianglePath, nil, self.bounds.size.width/2, self.bounds.origin.y);
    CGPathAddLineToPoint(trianglePath, nil, self.bounds.size.width, self.bounds.size.height);
    CGPathAddLineToPoint(trianglePath, nil, self.bounds.origin.x, self.bounds.size.height);
    CGPathCloseSubpath(trianglePath);
    layer.path = trianglePath;
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.fillColor = [UIColor redColor].CGColor;
    layer.opacity = 0.6;
}

@end