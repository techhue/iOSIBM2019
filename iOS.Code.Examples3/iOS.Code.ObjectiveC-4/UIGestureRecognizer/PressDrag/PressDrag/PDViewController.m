//
//  PDViewController .m
//  PressDrag
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "PDDemoView.h"
#import "PDViewController.h"
#import "PDPressDragGestureRecognizer.h"

@implementation PDViewController 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PDDemoView  *demoView = [[PDDemoView  alloc] initWithFrame:self.view.bounds];
    self.view = demoView;
    
    PDPressDragGestureRecognizer  *pressDragRecognizer = [[PDPressDragGestureRecognizer  alloc] initWithTarget:self action:@selector(handlePressDragGesture:)];
    [self.view addGestureRecognizer:pressDragRecognizer];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark -
#pragma mark UIPressDragGestureRecognizer handler

- (IBAction)handlePressDragGesture:(UIGestureRecognizer *)sender {
    if ([sender isMemberOfClass:[PDPressDragGestureRecognizer  class]]) {
        if (sender.state == UIGestureRecognizerStateBegan || sender.state == UIGestureRecognizerStateChanged) {
            CGPoint anchorPoint = ((PDPressDragGestureRecognizer  *)sender).anchorPoint;
            CGPoint dragPoint = ((PDPressDragGestureRecognizer  *)sender).dragPoint;
            
            ((PDDemoView  *)self.view).circleCenter = anchorPoint;
            
            CGFloat dx = dragPoint.x - anchorPoint.x;
            CGFloat dy = dragPoint.y - anchorPoint.y;
            if (sender.state == UIGestureRecognizerStateBegan) {
                ((PDDemoView  *)self.view).radius = 0;
            } else {
                ((PDDemoView  *)self.view).radius = sqrt(dx*dx + dy*dy);
            }
            
            ((PDDemoView  *)self.view).shouldDraw = YES;
        } else {
            ((PDDemoView  *)self.view).shouldDraw = NO;
        }
        [self.view setNeedsDisplay];
    }
}

@end
