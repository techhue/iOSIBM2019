//
//  CALAViewController.m
//  CALayerAnimation1
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "CALAViewController.h"

@interface CALAViewController ()

@end

@implementation CALAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    CALayer* layer = [CALayer layer];
    
	[layer setCornerRadius:15];
	[layer setBorderColor:[UIColor blackColor].CGColor];
	[layer setBorderWidth:5];
    
	[layer setFrame:CGRectMake(100, 100, 100, 100)];
	[layer setBackgroundColor:[UIColor yellowColor].CGColor];
    
	[self.view.layer addSublayer:layer];
    
	[layer setDelegate:self];
	[layer setNeedsDisplay];
    
	CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	[animation setDuration:2.0];
	[animation setRepeatCount:INT_MAX];
	[animation setFromValue:[NSNumber numberWithFloat:0] ];
	[animation setToValue:[NSNumber numberWithFloat:M_PI * 2.0]];
	[layer addAnimation:animation forKey:nil];
}

- (void) drawLayer:(CALayer*) layer inContext:(CGContextRef) ctx
{
	CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
	CGContextSetLineWidth(ctx, 5);
    
	CGContextMoveToPoint(ctx, 5, 5);
	CGContextAddLineToPoint(ctx, 95, 95);
    
	CGContextStrokePath(ctx);
}

@end
