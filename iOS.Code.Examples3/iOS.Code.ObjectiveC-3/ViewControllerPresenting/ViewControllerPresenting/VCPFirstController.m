//
//  VCPFirstController.m
//  ViewControllerPresenting
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "VCPFirstController.h"
#import "VCPSecondController.h"

@interface VCPFirstController ()

- (void)handleSingleTapGesture:(UITapGestureRecognizer*)recognizer;

@end

@implementation VCPFirstController

- (void)loadView
{
    [super loadView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200,100)];
    label.numberOfLines = 3;
    label.text = @"RIGHT NOW WE ARE IN FIRST VIEW CONTROLLER'S VIEW";
    label.center = self.view.center;
    label.font = [UIFont systemFontOfSize:25];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
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
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(handleSingleTapGesture:)];
    [singleTap setNumberOfTouchesRequired:1];
    [singleTap setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:singleTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleSingleTapGesture:(UITapGestureRecognizer *)recognizer
{
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        VCPSecondController *secondController = [[VCPSecondController alloc] init];
        [self presentViewController:secondController animated:YES
                         completion:^{
                             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"View Controller Presenting"
                                                                             message:@"Second View Controller Presented"
                                                                            delegate:nil
                                                                   cancelButtonTitle:@"Ok"
                                                                   otherButtonTitles:nil];
                             [alert show];
                         }];
    }
}

@end
