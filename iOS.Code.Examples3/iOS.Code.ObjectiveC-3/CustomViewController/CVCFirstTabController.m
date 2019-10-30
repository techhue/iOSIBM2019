//
//  CVCFirstTabController.m
//  CustomViewController
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "CVCFirstTabController.h"

@interface CVCFirstTabController ()

@end

@implementation CVCFirstTabController

- (void)loadView
{
    [super loadView];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.numberOfLines = 3;
    contentLabel.text = @"HAI, RIGHT NOW WE ARE IN FIRST TAB";
    contentLabel.font = [UIFont systemFontOfSize:20];
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.center = self.view.center;
    
    [self.view addSubview:contentLabel];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (id)init
{
    self = [super init];
    NSLog(@"\n%@\n",self);
    if(self)
    {
        NSLog(@"\n\n#####function name:-- %s\n\n",  __PRETTY_FUNCTION__);
        self.title = @"First Tab";
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
	// Do any additional setup after loading the view.
    NSLog(@"#####function name:-- %s",  __PRETTY_FUNCTION__);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
