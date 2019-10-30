//
//  CircleViewController.h
//  Circle
//
//  Created by jeff on 4/28/09.
//  Copyright Jeff LaMarche 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleSettingsController;

@interface CircleViewController : UIViewController <UIPopoverControllerDelegate>
{
    CircleSettingsController *settingsController;
    UIPopoverController *popover;
}

- (IBAction)openSettings:(id)sender;

@end
