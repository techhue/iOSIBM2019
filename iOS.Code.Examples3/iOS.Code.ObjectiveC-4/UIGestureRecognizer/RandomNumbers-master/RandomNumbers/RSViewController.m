//
//  RSViewController.m
//  RandomNumbers
//
//  Created by Ravi Shankar on 29/04/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "RSViewController.h"
#import "RandomNumber.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (UIEventSubtypeMotionShake) {
        [self displayNumber];
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self displayNumber];
}

-(void)displayNumber {
    RandomNumber *randomNumber = [[RandomNumber alloc] init];
    self.displayRandomNumber.text = [NSString stringWithFormat:@"%d",[randomNumber generateNumber]];
}

@end
