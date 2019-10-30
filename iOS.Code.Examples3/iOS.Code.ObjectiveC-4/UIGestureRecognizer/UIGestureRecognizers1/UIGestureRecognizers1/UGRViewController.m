//
//  UGRViewController.m
//  UIGestureRecognizers1
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "UGRViewController.h"

@interface UGRViewController ()
{
    UIImageView *_imageView;
}

@property (nonatomic, strong) UIImageView *imageView;

- (void)configureSingleTapGesture;
- (void)configureDoubleTapGesture;
- (void)configurePanGesture;
- (void)configurePinchGesture;

- (void)handleSingleTapGestureRecognizer:(UITapGestureRecognizer*)sender;
- (void)handleDoubleTapGestureRecognizer:(UITapGestureRecognizer*)sender;
- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer*)sender;
- (void)handlePinchGestureRecognizer:(UIPinchGestureRecognizer*)sender;

@end

@implementation UGRViewController

@synthesize imageView = _imageView;

- (void)loadView
{
    [super loadView];
    
    [self.view setUserInteractionEnabled:YES];
    [self configureSingleTapGesture];
    [self configureDoubleTapGesture];
    UITapGestureRecognizer *singleTap = [self.view.gestureRecognizers objectAtIndex:0];
    [singleTap requireGestureRecognizerToFail:[self.view.gestureRecognizers objectAtIndex:1]];
}

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

- (void)configureSingleTapGesture
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(handleSingleTapGestureRecognizer:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
}

- (void)configureDoubleTapGesture
{
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(handleDoubleTapGestureRecognizer:)];
    [doubleTap setNumberOfTapsRequired:2];
    [doubleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:doubleTap];
}

- (void)configurePanGesture
{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(handlePanGestureRecognizer:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [self.imageView addGestureRecognizer:panRecognizer];
}

- (void)configurePinchGesture
{
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(handlePinchGestureRecognizer:)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:pinchGesture];
}

- (void)configureRotationGesture
{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(handleRotationGestureRecognizer:)];
    [self.imageView addGestureRecognizer:rotation];
}

- (void)handleSingleTapGestureRecognizer:(UITapGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple.png"]];
        self.imageView.center = self.view.center;
        self.imageView.userInteractionEnabled = YES;
        [self.view addSubview:self.imageView];
        [self configurePanGesture];
        [self configurePinchGesture];
    }
}

- (void)handleDoubleTapGestureRecognizer:(UITapGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        [self.imageView removeFromSuperview];
        self.imageView = nil;
    }
}

- (void)handlePanGestureRecognizer:(UIPanGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [sender translationInView:sender.view];
        sender.view.center = CGPointMake(sender.view.center.x + translation.x,
                                         sender.view.center.y + translation.y);
        [sender setTranslation:CGPointMake(0, 0) inView:sender.view];
    }
}

- (void)handlePinchGestureRecognizer:(UIPinchGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateChanged)
    {
        CGFloat scale = [sender scale];
        self.imageView.transform = CGAffineTransformScale(sender.view.transform, scale, scale);
        sender.scale = 1;
    }
}

- (void)handleRotationGestureRecognizer:(UIRotationGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateChanged)
    {
        CGFloat rotation = [sender rotation];
        self.imageView.transform = CGAffineTransformRotate(sender.view.transform, rotation);
        sender.rotation = 0;
    }
}

@end
