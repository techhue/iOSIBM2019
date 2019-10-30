//
//  CVCSecondTabController.m
//  CustomViewController
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "CVCSecondTabController.h"

@interface CVCSecondTabController ()

@end

@implementation CVCSecondTabController

- (void)loadView
{
    [super loadView];
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.numberOfLines = 3;
    contentLabel.text = @"HAI, RIGHT NOW WE ARE IN SECOND TAB";
    contentLabel.font = [UIFont systemFontOfSize:20];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.center = self.view.center;
    
    [self.view addSubview:contentLabel];
    
    self.view.backgroundColor = [UIColor greenColor];
}


- (id)init
{
    self = [super init];
    if(self)
    {
        NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
        self.title = @"Second Tab";
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
