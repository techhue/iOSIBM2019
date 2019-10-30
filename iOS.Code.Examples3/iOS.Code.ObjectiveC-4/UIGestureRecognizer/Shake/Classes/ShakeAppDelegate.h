#import <UIKit/UIKit.h>

@class ShakeViewController;

@interface ShakeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ShakeViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ShakeViewController *viewController;

@end

