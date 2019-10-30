#import <UIKit/UIKit.h>

@class AccelerometerViewController;

@interface AccelerometerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AccelerometerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AccelerometerViewController *viewController;

@end

