//
//  HTPlayerView.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "HTVideoModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HTPlayerViewDelegate;
@interface HTPlayerView : UIView

@property (nonatomic, weak) id<HTPlayerViewDelegate> delegate;

/**
 对象方法创建对象

 @param frame      约束
 @param controller 所在的控制器
 @return           对象
 */
- (instancetype)initWithFrame:(CGRect)frame currentVC:(UIViewController *)controller;

/**
 设置要播放的视频列表和要播放的视频

 @param videoModels 存储视频model的数组
 @param videoId     当前要播放的视频id
 */
- (void)setVideoModels:(NSArray<HTVideoModel *> *)videoModels playVideoId:(NSString *)videoId;

/**
 设置覆盖的图片

 @param imageUrl 覆盖的图片url
 */
- (void)setCoverImage:(NSString *)imageUrl;

/**
 点击目录要播放的视频id

 @param videoId 要不放的视频id
 */
- (void)playVideoWithVideoId:(NSString *)videoId;

/**
 暂停
 */
- (void)pause;

/**
 停止
 */
- (void)stop;

@end
@protocol HTPlayerViewDelegate <NSObject>

// 是否可以播放
- (BOOL)playerViewShouldPlay;

@optional
// 播放结束
- (void)playerView:(HTPlayerView *)playView didPlayEndVideo:(HTVideoModel *)videoModel index:(NSInteger)index;
// 开始播放
- (void)playerView:(HTPlayerView *)playView didPlayVideo:(HTVideoModel *)videoModel index:(NSInteger)index;
// 播放中
- (void)playerView:(HTPlayerView *)playView didPlayVideo:(HTVideoModel *)videoModel playTime:(NSTimeInterval)playTime;

@end

NS_ASSUME_NONNULL_END
