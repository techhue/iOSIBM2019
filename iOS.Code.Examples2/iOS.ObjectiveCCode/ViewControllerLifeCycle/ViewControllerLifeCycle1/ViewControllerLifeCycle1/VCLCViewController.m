//
//  VCLCViewController.m
//  ViewControllerLifeCycle1
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "VCLCViewController.h"

@interface VCLCViewController ()

@end

@implementation VCLCViewController

- (id)init
{
    self = [super init];
    if(self)
    {
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
        NSLog(@"%s",  __PRETTY_FUNCTION__);
        NSLog(@"This is the designated initializer for this class. Although it might be not called if use storyboards.  \n\n");
    }
    return self;
}

- (void)loadView;
{
    [super loadView];
    NSLog(@"%s",  __PRETTY_FUNCTION__);
    NSLog(@"You should never call this method directly. The view controller calls this method when its view property is requested but is currently nil. This method loads or creates a view and assigns it to the view property. \n\n");
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

@end
