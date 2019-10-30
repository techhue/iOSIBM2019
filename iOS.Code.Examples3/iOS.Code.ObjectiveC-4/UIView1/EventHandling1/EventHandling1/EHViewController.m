//
//  EHViewController.m
//  EventHandling1
//
//  Created by josh on 8/11/14.
//  Copyright (c) 2014 TechHue Systems. All rights reserved.
//

#import "EHViewController.h"
#import "EHScratchPadView.h"

@interface EHViewController ()
{
    EHScratchPadView *_scratchPadView;
    UIButton *_clearDrawing;
    UIButton *_saveDrawing;
}

@property (nonatomic, strong) EHScratchPadView *scratchPadView;
@property (nonatomic, strong) UIButton *clearDrawing;
@property (nonatomic, strong) UIButton *saveDrawing;

- (void)saveDrwaing:(UIButton*)sender;
- (void)clearDrawing:(UIButton*)sender;

@end

@implementation EHViewController

@synthesize scratchPadView = _scratchPadView;
@synthesize clearDrawing = _clearDrawing;
@synthesize saveDrawing = _saveDrawing;

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
     self.scratchPadView = [[EHScratchPadView alloc]
                            initWithFrame:CGRectMake(self.view.bounds.origin.x,
                                                     self.view.bounds.origin.y,
                                                     self.view.bounds.size.width,
                                                     self.view.bounds.size.height - 60)];
    
    self.scratchPadView.drawColor = [UIColor greenColor];
    self.scratchPadView.drawWidth = 20.0f;
    self.scratchPadView.drawOpacity = 0.8f;
    self.scratchPadView.toolType = EHScratchPadToolTypePaint;
    
    [self.view addSubview:self.scratchPadView];
    
    self.clearDrawing = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.clearDrawing setTitle:@"Clear Pad" forState:UIControlStateNormal];
    [self.clearDrawing addTarget:self action:@selector(clearDrawing:)
                forControlEvents:UIControlEventTouchDown];
    [self.clearDrawing setFrame:CGRectMake(0,
                                           self.view.bounds.size.height - 50,
                                           self.view.bounds.size.width / 2, 50)];
    [self.view addSubview:self.clearDrawing];
    
    self.saveDrawing = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.saveDrawing setTitle:@"Save Pad" forState:UIControlStateNormal];
    [self.saveDrawing addTarget:self action:@selector(saveDrwaing:)
                forControlEvents:UIControlEventTouchDown];
    [self.saveDrawing setFrame:CGRectMake(self.view.bounds.size.width / 2,
                                          self.view.bounds.size.height - 50,
                                          self.view.bounds.size.width / 2, 50)];
    [self.view addSubview:self.saveDrawing];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveDrwaing:(UIButton *)sender
{
    UIImage *currentPad = [self.scratchPadView getSketch];
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[path objectAtIndex:0] stringByAppendingPathComponent:@"images"];
    filePath = [filePath stringByAppendingString:@"drawing.jpg"];
    NSData *data = UIImageJPEGRepresentation(currentPad, 1.0);
    [data writeToFile:filePath atomically:YES];
}

- (void)clearDrawing:(UIButton *)sender
{
    [self.scratchPadView clearToColor:[UIColor whiteColor]];
}

@end
