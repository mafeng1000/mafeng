//
//  HTTools.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTTools : NSObject

#pragma mark -  MBProgressHUD 方法
//显示菊花
+ (void)showHud;
//显示文字不消失
+ (void)showText:(NSString *)text;
//显示文字 自定义消失时间
+ (void)showText:(NSString *)text delay:(NSTimeInterval)dalay;
//显示文字+菊花
+ (void)showTextHud:(NSString *)text;
//成功 默认1.5s
+ (void)showOKHud:(NSString *)text;
//成功 自定义消失时间
+ (void)showOKHud:(NSString *)text delay:(NSTimeInterval)dalay;
//失败 默认1.5s
+ (void)showNOHud:(NSString *)text;
//失败 自定义消失时间
+ (void)showNOHud:(NSString *)text delay:(NSTimeInterval)dalay;
//自定义图片和文字
+ (void)showAnimated:(NSString *)imageName Text:(NSString *)text delay:(NSTimeInterval)dalay;
//移除
+ (void)hideHud;

//解析error
+ (void)jiexierrrorwitherror:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
