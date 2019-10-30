//
//  ALCViewController.m
//  ApplicationLifeCycle3
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "ALCViewController.h"

@interface ALCViewController ()

@end

@implementation ALCViewController

@synthesize question = _question;
@synthesize answer = _answer;

- (void)loadView
{
    [super loadView];
    NSLog(@"loadView");
    self.question = [[UITextField alloc] initWithFrame:CGRectMake(10,
                                                                  50,
                                                                  self.view.bounds.size.width - 20,
                                                                  30)];
    self.question.borderStyle = UITextBorderStyleRoundedRect;
    self.question.font = [UIFont systemFontOfSize:15];
    self.question.placeholder = @"enter text";
    self.question.autocorrectionType = UITextAutocorrectionTypeNo;
    self.question.keyboardType = UIKeyboardTypeDefault;
    self.question.returnKeyType = UIReturnKeyDone;
    self.question.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.question.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    [self.view addSubview:self.question];
    
    self.answer = [[UITextField alloc] initWithFrame:CGRectMake(10,
                                                                100,
                                                                self.view.bounds.size.width - 20,
                                                                30)];
    self.answer.borderStyle = UITextBorderStyleRoundedRect;
    self.answer.font = [UIFont systemFontOfSize:15];
    self.answer.placeholder = @"enter text";
    self.answer.autocorrectionType = UITextAutocorrectionTypeNo;
    self.answer.keyboardType = UIKeyboardTypeDefault;
    self.answer.returnKeyType = UIReturnKeyDone;
    self.answer.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.answer.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

    [self.view addSubview:self.answer];
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

@end
