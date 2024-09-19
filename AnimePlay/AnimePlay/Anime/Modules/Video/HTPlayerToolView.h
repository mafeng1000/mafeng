//
//  HTPlayerToolView.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <UIKit/UIKit.h>
#import "HTProgressSlider.h"

@protocol HTPlayerToolViewDelegate;
@interface HTPlayerToolView : UIView

@property (nonatomic, weak) id<HTPlayerToolViewDelegate> delegate;

@property (nonatomic, strong) UIButton * playSwitch;
@property (nonatomic, strong) UIButton * fullScreen;
@property (nonatomic, strong) UILabel * currentTimeLabel;
@property (nonatomic, strong) UILabel * totleTimeLabel;
@property (nonatomic, strong) HTProgressSlider * slider;

- (void)exitFullScreen;
@end
@protocol HTPlayerToolViewDelegate <NSObject>

@optional
- (void)toolView:(HTPlayerToolView *)toolView playSwitch:(BOOL)isPlay;
- (void)toolView:(HTPlayerToolView *)toolView fullScreen:(BOOL)isFull;
@end
