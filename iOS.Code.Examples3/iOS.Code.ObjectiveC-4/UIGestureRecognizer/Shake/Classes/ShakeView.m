#import "ShakeView.h"


@implementation ShakeView

@synthesize shakeDelegate;

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	if (motion == UIEventSubtypeMotionShake) {
		if ([self.shakeDelegate respondsToSelector:@selector(shake)]) {
			[self.shakeDelegate performSelector:@selector(shake)];
		}
	}
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}

//- (id)initWithFrame:(CGRect)frame {
//    if ((self = [super initWithFrame:frame])) {
//        // Initialization code
//    }
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
	self.shakeDelegate = nil;
    [super dealloc];
}


@end
