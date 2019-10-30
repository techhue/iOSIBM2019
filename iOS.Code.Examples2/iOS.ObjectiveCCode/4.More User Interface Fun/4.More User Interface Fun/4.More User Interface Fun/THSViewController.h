//
//  THSViewController.h
//  4.More User Interface Fun
//
//  Created by naga on 1/5/14.
//  Copyright (c) 2014 TechHueSystems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class THSUITextField; // 1
@class THSUILabel; // 2
@class THSUIImageView; // 3
@class THSUIView; // 4
@class THSSlider; // 5
@class THSSegmentedControl; // 6
@class THSSwitch; // 7
@class THSButton; // 8

@interface THSViewController : UIViewController <UIActionSheetDelegate> // 9

@property (nonatomic, strong) THSUIView *controlView;

@property (nonatomic, strong) THSUITextField *nameField;
@property (nonatomic, strong) THSUITextField *numberField;

@property (nonatomic, strong) THSUILabel *name;
@property (nonatomic, strong) THSUILabel *number;
@property (nonatomic, strong) THSUILabel *sliderLabel;

@property (nonatomic, strong) THSUIImageView *imageView;

@property (nonatomic, strong) THSSlider *slider;

@property (nonatomic, strong) THSSegmentedControl *segmented;

@property (nonatomic, strong) THSSwitch *leftSwitch;
@property (nonatomic, strong) THSSwitch *rightSwitch;
@property (nonatomic, strong) THSButton *doSomethingButton;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)sliderChanged:(UISlider *)sender;
- (IBAction)switchChanged:(UISwitch *)sender;
- (IBAction)toggleControls:(UISegmentedControl *)sender;
- (IBAction)buttonPressed:(id)sender;

@end
