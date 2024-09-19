//
//  UIView+THView.h
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (THView)

/**
 快速给View添加4边阴影
 参数:阴影透明度，默认0
 */
- (void)ht_addProjectionWithShadowOpacity:(CGFloat)shadowOpacity;
/**
 快速给View添加4边框
 参数:边框宽度
 */
- (void)ht_addBorderWithWidth:(CGFloat)width;
/**
 快速给View添加4边框
 width:边框宽度
 borderColor:边框颜色
 */
- (void)ht_addBorderWithWidth:(CGFloat)width borderColor:(UIColor *)borderColor;
/**
 快速给View添加圆角
 参数:圆角半径
 */
- (void)ht_addRoundedCornersWithRadius:(CGFloat)radius;
/**
 快速给View添加圆角
 radius:圆角半径
 corners:且那几个角
 类型共有以下几种:
 typedef NS_OPTIONS(NSUInteger, UIRectCorner) {
 UIRectCornerTopLeft,
 UIRectCornerTopRight ,
 UIRectCornerBottomLeft,
 UIRectCornerBottomRight,
 UIRectCornerAllCorners
 };
 使用案例:[self.mainView addRoundedCornersWithRadius:10 byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight]; // 切除了左下 右下
 */
- (void)ht_addRoundedCornersWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners;
@end


NS_ASSUME_NONNULL_END
