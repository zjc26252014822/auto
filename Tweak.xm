#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static void ASForceAutoLock(UIApplication *app) {
    if (app && app.idleTimerDisabled) app.idleTimerDisabled = NO;
}

%hook UIApplication
- (void)setIdleTimerDisabled:(BOOL)disabled {
    %orig(NO);
}
- (void)_setIdleTimerDisabled:(BOOL)disabled {
    %orig(NO);
}
%end

%ctor {
    if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.springboard"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ASForceAutoLock([UIApplication sharedApplication]);
        });
    }
}
