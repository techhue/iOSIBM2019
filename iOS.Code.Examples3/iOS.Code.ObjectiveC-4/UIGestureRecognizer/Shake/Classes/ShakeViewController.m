#import "ShakeViewController.h"
#import "ShakeView.h"

#define kShakeDuration 3

@implementation ShakeViewController

@synthesize theDie;
@synthesize shaking;

- (void)loadImages {
	NSMutableArray *faces = [NSMutableArray array];
	[faces addObject:[UIImage imageNamed:@"2"]];
	[faces addObject:[UIImage imageNamed:@"1"]];
	[faces addObject:[UIImage imageNamed:@"4"]];
	[faces addObject:[UIImage imageNamed:@"5"]];
	[faces addObject:[UIImage imageNamed:@"3"]];
	[faces addObject:[UIImage imageNamed:@"6"]];
	self.theDie.animationImages = faces;
	self.theDie.animationDuration = .6;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self loadImages];
}


- (void)stopRolling {
	self.shaking = NO;
	[self.theDie stopAnimating];
	self.theDie.image = [self.theDie.animationImages objectAtIndex:arc4random() % 6];
}

- (void)startRolling {
	self.shaking = YES;
	[self.theDie startAnimating];
}

- (void)shake {
	if(!self.shaking) {
		[self startRolling];
		[NSTimer scheduledTimerWithTimeInterval:kShakeDuration
										 target:self
									   selector:@selector(stopRolling) 
									   userInfo:nil
										repeats:NO];
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.view becomeFirstResponder];
	[(ShakeView *)self.view setShakeDelegate:self];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
