//
//  BaseViewController.m
//  ForcedRotation
//
//  Created by Tom Parry on 15/11/12.
//  Copyright (c) 2012 b2cloud. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	//	(iOS 5)
	//	Only allow rotation to portrait
	return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL) shouldAutorotate
{
	//	(iOS 6)
	//	No auto rotating
	return NO;
}

- (NSUInteger) supportedInterfaceOrientations
{
	//	(iOS 6)
	//	Only allow rotation to portrait
	return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation
{
	//	(iOS 6)
	//	Force to portrait
	return UIInterfaceOrientationPortrait;
}

@end
