//
//  RCViewController.m
//  UIResponderChain
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "RCViewController.h"
#import "RCRightView.h"
#import "RCCenterView.h"

@interface RCViewController ()
{
    UIView *_leftView;
    RCCenterView *_centerView;
    RCRightView *_rightView;
}

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) RCCenterView *centerView;
@property (nonatomic, strong) RCRightView *rightView;

- (void)configureLeftView;
- (void)configureRightView;
- (void)configureCenterView;

- (UILabel*)titleLabel;


@end

@implementation RCViewController

@synthesize leftView = _leftView;
@synthesize centerView = _centerView;
@synthesize rightView = _rightView;

- (void)loadView
{
    [super loadView];
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
    [self configureLeftView];
    [self configureRightView];
    [self configureCenterView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureLeftView
{
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,
                                                             self.view.bounds.origin.y,
                                                             self.view.bounds.size.width/3,
                                                             self.view.bounds.size.height)];
    self.leftView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.leftView];
    
    UILabel *title = [self titleLabel];
    title.text = @"Left View";
    [self.leftView addSubview:title];
}

- (void)configureRightView
{
    self.rightView = [[RCRightView alloc] initWithFrame:CGRectMake(2 * (self.view.bounds.size.width/3),
                                                                   self.view.bounds.origin.y,
                                                                   self.view.bounds.size.width/3,
                                                                   self.view.bounds.size.height)];
    self.rightView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.rightView];
    
    UILabel *title = [self titleLabel];
    title.text = @"Right View";
    [self.rightView addSubview:title];
}

- (void)configureCenterView
{
    self.centerView = [[RCCenterView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/3,
                                                                     self.view.bounds.origin.y,
                                                                     self.view.bounds.size.width/3,
                                                                     self.view.bounds.size.height)];
    self.centerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.centerView];
    
    UILabel *title = [self titleLabel];
    title.text = @"Center View";
    [self.centerView addSubview:title];
}

- (UILabel*)titleLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    return label;

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
