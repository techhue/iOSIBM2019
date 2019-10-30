#import <UIKit/UIKit.h>

@interface AccelerometerViewController : UIViewController <UIAccelerometerDelegate> {
	float accelX;
	float accelY;
	float accelZ;
}

@property (nonatomic, retain) IBOutlet UIProgressView *x;
@property (nonatomic, retain) IBOutlet UIProgressView *y;
@property (nonatomic, retain) IBOutlet UIProgressView *z;

@end

