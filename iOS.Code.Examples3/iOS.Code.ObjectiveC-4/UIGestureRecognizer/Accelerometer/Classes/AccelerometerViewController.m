#import "AccelerometerViewController.h"

#define kFilteringFactor 0.1

@implementation AccelerometerViewController

@synthesize x;
@synthesize y;
@synthesize z;

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval: 1/30.0]; // 30Hz
	[[UIAccelerometer sharedAccelerometer] setDelegate: self];
}

- (void)viewWillDisappear:(BOOL)animated {
	[[UIAccelerometer sharedAccelerometer] setDelegate: nil];
	[super viewWillDisappear:animated];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer 
        didAccelerate:(UIAcceleration *)acceleration {
	
// flip to "#if 1" to turn on "#if 0" to turn off
	
	// no filter
#if 1
	self.x.progress = (acceleration.x + 2) / 4;
	self.y.progress = (acceleration.y + 2) / 4;
	self.z.progress = (acceleration.z + 2) / 4;
#endif
	
	// low-pass filter
#if 0
	accelX = (acceleration.x * kFilteringFactor) + (accelX * (1.0 - kFilteringFactor));
	accelY = (acceleration.y * kFilteringFactor) + (accelY * (1.0 - kFilteringFactor));
	accelZ = (acceleration.z * kFilteringFactor) + (accelZ * (1.0 - kFilteringFactor));
	
	self.x.progress = (accelX + 2) / 4;
	self.y.progress = (accelY + 2) / 4;
	self.z.progress = (accelZ + 2) / 4;
#endif

	// high-pass filter
#if 0
	accelX = acceleration.x - ((acceleration.x * kFilteringFactor) + 
							   (accelX * (1.0 - kFilteringFactor)));
	accelY = acceleration.y - ((acceleration.y * kFilteringFactor) + 
							   (accelY * (1.0 - kFilteringFactor)));
	accelZ = acceleration.z - ((acceleration.z * kFilteringFactor) + 
							   (accelZ * (1.0 - kFilteringFactor)));
	self.x.progress = (accelX + 2) / 4;
	self.y.progress = (accelY + 2) / 4;
	self.z.progress = (accelZ + 2) / 4;
#endif

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
	self.x = nil;
	self.y = nil;
	self.z = nil;
    [super dealloc];
}

@end
