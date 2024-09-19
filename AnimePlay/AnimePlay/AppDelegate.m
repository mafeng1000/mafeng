//
//  AppDelegate.m
//  AnimePlay
//
//  Created by MAC on 2024/9/14.
//

#import "AppDelegate.h"
#import "HTTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self switchRootViewController];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}
- (void)switchRootViewController{
    HTTabBarController *vc = [[HTTabBarController alloc]init];
    self.window.rootViewController = vc;
}


- (void)setLaunchScreen:(BOOL)launchScreen {

    _launchScreen = launchScreen;
    [self application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:nil];
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {

    if (self.isLaunchScreen) {
        // 只支持横屏，并且 Home 按键在右边
        return UIInterfaceOrientationMaskLandscapeRight;
    }

    // 只支持竖屏
    return UIInterfaceOrientationMaskPortrait;
}


@end
