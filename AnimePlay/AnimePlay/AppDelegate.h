//
//  AppDelegate.h
//  AnimePlay
//
//  Created by MAC on 2024/9/14.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign, getter=isLaunchScreen) BOOL launchScreen;


@end

