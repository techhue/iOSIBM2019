//
//  CSVViewController.m
//  CustomShapeViews
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "CSVViewController.h"
#import "CSVTraingleView.h"
#import "CSVCircleView.h"
#import "CSVOctagonView.h"

@interface CSVViewController ()

- (void)drawTraingleView;
- (void)drawCircleView;
- (void)drawOctagon;

@end

@implementation CSVViewController

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
    [self drawTraingleView];
    [self drawCircleView];
    [self drawOctagon];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawTraingleView
{
    CSVTraingleView *view = [[CSVTraingleView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.view addSubview:view];
}

- (void)drawCircleView
{
    CSVCircleView *cirecleView = [[CSVCircleView alloc] initWithFrame:CGRectMake(130, 20, 100, 100)];
    [self.view addSubview:cirecleView];
}

- (void)drawOctagon
{
    CSVOctagonView *octagon = [[CSVOctagonView alloc] initWithFrame:CGRectMake(20, 130, 100, 100)];
    [self.view addSubview:octagon];
}

@end
