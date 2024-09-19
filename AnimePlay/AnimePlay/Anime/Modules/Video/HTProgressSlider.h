//
//  HTProgressSlider.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, HTSliderDirection) {
    
    HTSliderDirectionHorizonal = 0,
    HTSliderDirectionVertical  = 1
};
@interface HTProgressSlider : UIControl

// 最小值
@property (nonatomic, assign) CGFloat minValue;
// 最大值
@property (nonatomic, assign) CGFloat maxValue;
// 滑动值
@property (nonatomic, assign) CGFloat value;
// 滑动百分比
@property (nonatomic, assign) CGFloat sliderPercent;
// 缓冲的百分比
@property (nonatomic, assign) CGFloat progressPercent;
// 是否正在滑动  如果在滑动的是偶外面监听的回调不应该设置sliderPercent progressPercent 避免绘制混乱
@property (nonatomic, assign) BOOL isSliding;
// 方向
@property (nonatomic, assign) HTSliderDirection direction;

- (instancetype)initWithFrame:(CGRect)frame direction:(HTSliderDirection)direction;
@end


NS_ASSUME_NONNULL_END
