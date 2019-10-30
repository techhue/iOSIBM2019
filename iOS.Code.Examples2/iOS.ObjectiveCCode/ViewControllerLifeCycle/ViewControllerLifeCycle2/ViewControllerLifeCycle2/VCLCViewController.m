//
//  VCLCViewController.m
//  ViewControllerLifeCycle1
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "VCLCViewController.h"
#import "VCLCView.h"

@interface VCLCViewController ()

- (void)buttonClick:(id)sender;

@end

@implementation VCLCViewController

- (id)init
{
    self = [super init];
    if(self)
    {
//        NSLog(@"%@", NSStringFromSelector(_cmd));
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        NSLog(@" Unarchive data from nib or storyboard \n\n");
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [self encodeWithCoder:aCoder];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@" Encode the receiver  \n\n");
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
        NSLog(@"This is the designated initializer for this class. Although it might be not called if use storyboards.  \n\n");
    }
    return self;
}

- (void)loadView;
{
    [super loadView];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"You should never call this method directly. The view controller calls this method when its view property is requested but is currently nil. This method loads or creates a view and assigns it to the view property. \n\n");
    
    VCLCView *view = [[VCLCView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button setTitle:@"TaggleView" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [view addSubview:button];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"Prepares the receiver for service after it has been loaded from an Interface Builder archive, or nib file. \n\n");
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"This method is called after the view controller has loaded its view hierarchy into memory. \n\n");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick:(id)sender
{
    /*self.view.hidden = (self.view.hidden) ? NO:YES;
    self.view = nil;*/
}

// Called when the view is about to made visible. Default does nothing

- (void)viewWillAppear:(BOOL)animated;{
    NSLog(@"BOOL %c", animated);
    [super viewWillAppear:animated];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"This method is called before the receiver’s view is about to be added to a view hierarchy and before any animations are configured for showing the view. \n\n");
}

- (void)viewDidAppear:(BOOL)animated;     // Called when the view has been fully transitioned onto the screen. Default does nothing
{
    [super viewDidAppear:animated];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"Notifies the view controller that its view was added to a view hierarchy. You can override this method to perform additional tasks associated with presenting the view. \n\n");
    
}

// Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewWillDisappear:(BOOL)animated;
{
    [super viewWillDisappear:animated];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"Notifies the view controller that its view is about to be removed from a view hierarchy.This method is called in response to a view being removed from a view hierarchy. This method is called before the view is actually removed and before any animations are configured. \n\n");
    
}
- (void)viewDidDisappear:(BOOL)animated;  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
{
    [super viewDidDisappear:animated];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"Notifies the view controller that its view was removed from a view hierarchy. \n\n");
    
}
// Called just before the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.

- (void)viewWillLayoutSubviews NS_AVAILABLE_IOS(5_0);
// Called just after the view controller's view's layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
{
    [super viewWillLayoutSubviews];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"Called to notify the view controller that its view is about to layout its subviews.When a view’s bounds change, the view adjusts the position of its subviews. Your view controller can override this method to make changes before the view lays out its subviews.  \n\n");
    
}
- (void)viewDidLayoutSubviews NS_AVAILABLE_IOS(5_0);
{
    [super viewDidLayoutSubviews];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"Called to notify the view controller that its view has just laid out its subviews. When the bounds change for a view controller’s view, the view adjusts the positions of its subviews and then the system calls this method. However, this method being called does not indicate that the individual layouts of the view’s subviews have been adjusted. Each subview is responsible for adjusting its own layout.  \n\n");
    
}

@end
