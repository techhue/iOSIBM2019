//
//  THSViewController.m
//  4.More User Interface Fun
//
//  Created by naga on 1/5/14.
//  Copyright (c) 2014 TechHueSystems. All rights reserved.
//

#import "THSViewController.h"

#import "THSUIImageView.h"
#import "THSUITextField.h"
#import "THSUILabel.h"
#import "THSUIView.h"
#import "THSSlider.h"
#import "THSSegmentedControl.h"
#import "THSSwitch.h"
#import "THSButton.h"

@interface THSViewController ()

@end

@implementation THSViewController

@synthesize controlView;
@synthesize nameField, numberField;
@synthesize name, number, sliderLabel;
@synthesize imageView;
@synthesize slider;
@synthesize segmented;

@synthesize leftSwitch, rightSwitch;
@synthesize doSomethingButton;

- (void)loadView
{
    [super loadView];
    controlView = [[THSUIView alloc] initWithFrame:self.view.bounds];
    [controlView addTarget:self
                    action:@selector(backgroundTap:)
          forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:controlView];
    
    UIImage *image = [UIImage imageNamed:@"AppleIcon.jpeg"];
    imageView = [[THSUIImageView alloc] initWithFrame:CGRectMake(110, 30, 100, 100)];
    imageView.image = image;
    [controlView addSubview:imageView];
    
    nameField = [[THSUITextField alloc] initWithFrame:CGRectMake(120, 130, 170, 30)];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    nameField.font = [UIFont systemFontOfSize:17];
    nameField.keyboardType = UIKeyboardTypeDefault;
    [nameField addTarget:self
                  action:@selector(textFieldDoneEditing:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    [controlView addSubview:nameField];
    
    numberField = [[THSUITextField alloc] initWithFrame:CGRectMake(120, 170, 170, 30)];
    numberField.borderStyle = UITextBorderStyleRoundedRect;
    numberField.font = [UIFont systemFontOfSize:17];
    numberField.keyboardType = UIKeyboardTypeNumberPad;
    [numberField addTarget:self
                  action:@selector(textFieldDoneEditing:)
        forControlEvents:UIControlEventEditingDidEndOnExit];

    [controlView addSubview:numberField];
    
    name = [[THSUILabel alloc] initWithFrame:CGRectMake(30, 130, 80, 30)];
    name.text = @"Name";
    name.textAlignment = NSTextAlignmentLeft;
    name.font = [UIFont systemFontOfSize:17];
    name.textColor = [UIColor blackColor];
    [controlView addSubview:name];
    
    number = [[THSUILabel alloc] initWithFrame:CGRectMake(30, 170, 80, 30)];
    number.text = @"Number";
    number.textAlignment = NSTextAlignmentLeft;
    number.font = [UIFont systemFontOfSize:15];
    name.textColor = [UIColor blackColor];
    [controlView addSubview:number];
    
    sliderLabel = [[THSUILabel alloc] initWithFrame:CGRectMake(30, 210, 40, 20)];
    sliderLabel.text = @"0";
    sliderLabel.textAlignment = NSTextAlignmentLeft;
    sliderLabel.font = [UIFont systemFontOfSize:15];
    sliderLabel.textColor = [UIColor blackColor];
    [controlView addSubview:sliderLabel];
    
    slider = [[THSSlider alloc] initWithFrame:CGRectMake(80, 210, 210, 20)];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    [slider addTarget:self
               action:@selector(sliderChanged:)
     forControlEvents:UIControlEventValueChanged];
    [controlView addSubview:slider];
    
    NSArray *item = [NSArray arrayWithObjects:@"Switches", @"Button", nil];
    segmented = [[THSSegmentedControl alloc] initWithItems:item];
    segmented.frame = CGRectMake(30, 240, 260, 50);
    [segmented setSegmentedControlStyle:UISegmentedControlStylePlain];
    segmented.selectedSegmentIndex = 0;
    [segmented addTarget:self
                  action:@selector(toggleControls:)
        forControlEvents:UIControlEventValueChanged];
    [controlView addSubview:segmented];
    
    leftSwitch = [[THSSwitch alloc] initWithFrame:CGRectMake(30, 320, 50, 25)];
    [leftSwitch setOn:YES animated:YES];
    [leftSwitch addTarget:self
                   action:@selector(switchChanged:)
         forControlEvents:UIControlEventValueChanged];
    [controlView addSubview:leftSwitch];
    
    rightSwitch = [[THSSwitch alloc] initWithFrame:CGRectMake(220, 320, 50, 25)];
    [rightSwitch setOn:YES animated:YES];
    [rightSwitch addTarget:self
                   action:@selector(switchChanged:)
         forControlEvents:UIControlEventValueChanged];
    [controlView addSubview:rightSwitch];
    
    doSomethingButton = [[THSButton alloc] initWithFrame:CGRectMake(30, 320, 260, 30)];
    [doSomethingButton setTitle:@"doSomethingButton" forState:UIControlStateNormal];
    doSomethingButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [doSomethingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    doSomethingButton.hidden = YES;
    doSomethingButton.backgroundColor = [UIColor grayColor];
    doSomethingButton.layer.cornerRadius = 10.0;
    doSomethingButton.layer.borderWidth = 1.0;
    doSomethingButton.layer.borderColor = [UIColor blackColor].CGColor;
    doSomethingButton.layer.shadowOffset = CGSizeMake(10, 10);
    doSomethingButton.layer.shadowOpacity = 8.0;
    doSomethingButton.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    
    [doSomethingButton addTarget:self
                          action:@selector(buttonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [controlView addSubview:doSomethingButton];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {
    [nameField resignFirstResponder];
    [numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    int progress = lroundf(sender.value);
    sliderLabel.text = [NSString stringWithFormat:@"%d", progress];
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    // 0 == switches index
    if (sender.selectedSegmentIndex == 0) {
        leftSwitch.hidden = NO;
        rightSwitch.hidden = NO;
        doSomethingButton.hidden = YES;
    }
    else
    {
        leftSwitch.hidden = YES;
        rightSwitch.hidden = YES;
        doSomethingButton.hidden = NO;
    }
}

- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting = sender.isOn;
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
}

- (IBAction)buttonPressed:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I’m Sure!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet
didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex])
    {
        NSString *msg = nil;
        
        if (nameField.text.length > 0)
            msg = [NSString stringWithFormat:
                   @"You can breathe easy, %@, everything went OK.",
                   nameField.text];
        else
            msg = @"You can breathe easy, everything went OK.";
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Phew!"
                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
