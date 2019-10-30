//
//  ALCViewController.h
//  ApplicationLifeCycle3
//
//  Created by josh on 8/5/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALCViewController : UIViewController
{
    UITextField *_question;
    UITextField *_answer;
}

@property (nonatomic, strong) UITextField *question;
@property (nonatomic, strong) UITextField *answer;

@end
