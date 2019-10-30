//
//  UGRViewController.m
//  UIGestureRecognizer2
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "UGRViewController.h"

@interface UGRViewController ()
{
    UIView *_firstView;
    UIView *_secondView;
}

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;

- (void)configureLeftSwipeGesture;
- (void)configureRightSwipeGesture;
- (void)configureLongPressGesture;

- (void)handleLeftSwipeGestureRecognizer:(UISwipeGestureRecognizer*)sender;
- (void)handleRightSwipeGestureRecognizer:(UISwipeGestureRecognizer*)sender;
- (void)handleLongPressGestureRecognizer:(UILongPressGestureRecognizer*)sender;

@end

@implementation UGRViewController

- (void)loadView
{
    [super loadView];
   
    UILabel *label;
    
    self.secondView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.secondView.backgroundColor = [UIColor orangeColor];
    self.secondView.hidden = YES;
    [self.view addSubview:self.secondView];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    label.text = @"Second View";
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    label.center = self.view.center;
    [self.secondView addSubview:label];
    
    self.firstView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.firstView.backgroundColor = [UIColor lightGrayColor];
    self.firstView.hidden = NO;
    [self.view addSubview:self.firstView];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    label.text = @"First View";
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    label.center = self.firstView.center;
    [self.firstView addSubview:label];
    
    [self configureLeftSwipeGesture];
    [self configureRightSwipeGesture];
    [self configureLongPressGesture];
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

- (void)configureLeftSwipeGesture
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(handleLeftSwipeGestureRecognizer:)];
    [swipeGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeGesture];
}

- (void)configureRightSwipeGesture
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(handleRightSwipeGestureRecognizer:)];
    [swipeGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeGesture];
}

- (void)configureLongPressGesture
{
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]
                                                      initWithTarget:self
                                                      action:@selector(handleLongPressGestureRecognizer:)];
    [longPressGesture setNumberOfTouchesRequired:1];
    [longPressGesture setMinimumPressDuration:0.5];
    [self.view addGestureRecognizer:longPressGesture];
}

- (void)handleLeftSwipeGestureRecognizer:(UISwipeGestureRecognizer *)sender
{
   CATransition *transition = [CATransition animation];
   transition.startProgress = 0.0;
   transition.endProgress = 1.0;
   transition.type = kCATransitionPush;
   transition.subtype = kCATransitionFromRight;
   transition.duration = 1.0;
    
   [self.firstView.layer addAnimation:transition forKey:@"transition"];
   [self.secondView.layer addAnimation:transition forKey:@"transition"];
    
   self.firstView.hidden = YES;
   self.secondView.hidden = NO;
}

- (void)handleRightSwipeGestureRecognizer:(UISwipeGestureRecognizer *)sender
{
    CATransition *transition = [CATransition animation];
    transition.startProgress = 0.0;
    transition.endProgress = 1.0;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    transition.duration = 1.0;
    
    [self.secondView.layer addAnimation:transition forKey:@"transition"];
    [self.firstView.layer addAnimation:transition forKey:@"transition"];
    
    
    self.firstView.hidden = NO;
    self.secondView.hidden = YES;
}

- (void)handleLongPressGestureRecognizer:(UILongPressGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateBegan)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Long Press Gesture"
                                                            message:@"Delete CurrentView"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
        [alert show];
        if(self.firstView.hidden)
        {
            [self.secondView removeFromSuperview];
            self.firstView.hidden = NO;
        }
        if(self.secondView.hidden)
        {
            [self.firstView removeFromSuperview];
            self.secondView.hidden = NO;
        }
    }
}

@end
