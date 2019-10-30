//
//  CVCViewController.m
//  CustomViewController
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "CVCViewController.h"
#import "CVCFirstTabController.h"
#import "CVCSecondTabController.h"

@interface CVCViewController ()
{
    UIView *_contentView;
    UIView *_tabBar;
    UIView *_firstTab;
    UIView *_secondTab;
    
    CVCFirstTabController *_firstTabController;
    CVCSecondTabController *_secondTabController;
}

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *tabBar;
@property (nonatomic, strong) UIView *firstTab;
@property (nonatomic, strong) UIView *secondTab;

@property (nonatomic, strong) CVCFirstTabController *firstTabController;
@property (nonatomic, strong) CVCSecondTabController *secondTabController;

- (void)configureFirstTabView;
- (void)configureSecondTabView;
- (void)configureContentView;
- (void)configureTabBarView;

- (void)configureTitleLabel:(UILabel*)label;

- (void)handleFirstTabGestureRecognizer:(UITapGestureRecognizer*)recognizer;
- (void)handleSecondTabGestureRecognizer:(UITapGestureRecognizer*)recognizer;

@end

@implementation CVCViewController

@synthesize contentView = _contentView;
@synthesize tabBar = _tabBar;
@synthesize firstTab = _firstTab;
@synthesize secondTab = _secondTab;

@synthesize firstTabController = _firstTabController;
@synthesize secondTabController = _secondTabController;

- (void)loadView
{
    [super loadView];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
    self.firstTabController = [[CVCFirstTabController alloc] init];
    self.secondTabController = [[CVCSecondTabController alloc] init];
    
    [self configureContentView];
    [self configureTabBarView];
    [self configureFirstTabView];
    [self configureSecondTabView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureFirstTabView
{
    self.firstTab = [[UIView alloc] initWithFrame:CGRectMake(self.tabBar.bounds.origin.x,
                                                             self.tabBar.bounds.origin.x,
                                                             self.tabBar.bounds.size.width/2,
                                                             self.tabBar.bounds.size.height)];
    self.firstTab.backgroundColor = [UIColor orangeColor];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    title.text = self.firstTabController.title;
    [self configureTitleLabel:title];
    [self.firstTab addSubview:title];
    
    [self.tabBar addSubview:self.firstTab];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(handleFirstTabGestureRecognizer:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.firstTab addGestureRecognizer:singleTap];

}

- (void)configureSecondTabView
{
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
    self.secondTab = [[UIView alloc] initWithFrame:CGRectMake(self.tabBar.bounds.size.width/2,
                                                              self.tabBar.bounds.origin.y,
                                                              self.tabBar.bounds.size.width/2,
                                                              self.tabBar.bounds.size.height)];
    self.secondTab.backgroundColor = [UIColor magentaColor];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    title.text = self.secondTabController.title;
    [self configureTitleLabel:title];
    [self.secondTab addSubview:title];
    [self.tabBar addSubview:self.secondTab];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(handleSecondTabGestureRecognizer:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.secondTab addGestureRecognizer:singleTap];
}

- (void)configureContentView
{
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,
                                                                self.view.bounds.origin.y,
                                                                self.view.bounds.size.width,
                                                                self.view.bounds.size.height - 50)];
    self.contentView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.contentView];
}

- (void)configureTabBarView
{
    self.tabBar = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,
                                                           self.view.bounds.size.height - 50,
                                                           self.view.bounds.size.width,
                                                           50)];
    self.tabBar.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tabBar];
}

- (void)configureTitleLabel:(UILabel *)label
{
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
    label.center = self.firstTab.center;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
}

- (void)handleFirstTabGestureRecognizer:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
    [self.secondTabController willMoveToParentViewController:nil];
    [self.secondTabController.view removeFromSuperview];
    [self.secondTabController removeFromParentViewController];
    
    [self addChildViewController:self.firstTabController];
    self.firstTabController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.firstTabController.view];
    [self.firstTabController didMoveToParentViewController:self];
}

- (void)handleSecondTabGestureRecognizer:(UITapGestureRecognizer *)recognizer
{
    [self.firstTabController willMoveToParentViewController:nil];
    [self.firstTabController.view removeFromSuperview];
    [self.firstTabController removeFromParentViewController];
    
    [self addChildViewController:self.secondTabController];
    self.secondTabController.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.secondTabController.view];
    [self.secondTabController didMoveToParentViewController:self];
}

@end
