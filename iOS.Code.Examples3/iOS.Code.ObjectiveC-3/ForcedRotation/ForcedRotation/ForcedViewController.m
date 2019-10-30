//
//  ForcedViewController.m
//  ForcedRotation
//
//  Created by Tom Parry on 15/11/12.
//  Copyright (c) 2012 b2cloud. All rights reserved.
//

#import "ForcedViewController.h"

@interface ForcedViewController ()
{
	BOOL canRotateToAllOrientations;
}

@end

@implementation ForcedViewController

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	//	We're going onto the screen, disable auto rotations
	canRotateToAllOrientations = NO;
}

- (void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	//	We're now on the screen, reenable auto rotations
	canRotateToAllOrientations = YES;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	//	(iOS 5)
	//	If we can auto rotate then only all orientations except upside down
	if(canRotateToAllOrientations)
		return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	//	Otherwise only allow our forced orienation (see below)
	return (toInterfaceOrientation == self.preferredInterfaceOrientationForPresentation);
}


- (BOOL) shouldAutorotate
{
	//	(iOS 6)
	//	Only auto rotate if we're on the screen (see above)
	return canRotateToAllOrientations;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	//	(iOS 6)
	//	Prefer (force) landscape
	return UIInterfaceOrientationLandscapeRight;
}

@end
