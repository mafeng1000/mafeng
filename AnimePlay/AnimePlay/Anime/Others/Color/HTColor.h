//
//  HTColor.h
//  AnimePlay
//
//  Created by MAC on 2024/9/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface HTColor : NSObject

/**hex值初始化颜色*/
+ (UIColor *(^)(NSString *))ht_colorWithHexString;

/**RGB值初始化颜色*/
+ (UIColor *(^)(CGFloat,CGFloat,CGFloat))ht_RGB;

/**RGBA值初始化颜色*/
+ (UIColor *(^)(CGFloat,CGFloat,CGFloat,CGFloat))ht_RGBA;

/**随机色*/
+ (UIColor *)ht_randomColor;

/**更改当前颜色的apha*/
+ (UIColor *(^)(UIColor *,CGFloat))ht_colorChangeAlpha;

/**白色*/
@property(class, nonatomic, readonly) UIColor *ht_whiteColor;

/**黑色*/
@property(class, nonatomic, readonly) UIColor *ht_blackColor;

/**背景色*/
@property (nonatomic, class, readonly) UIColor *ht_backGroundColor;

/**定制蓝色*/
@property (nonatomic, class, readonly) UIColor *ht_themeColor;

/**text*/
@property (nonatomic, class, readonly) UIColor *ht_textColor;

/**navigationBar*/
@property (nonatomic, class, readonly) UIColor *ht_navigationBarColor;

/**button text color*/
@property (nonatomic, class, readonly) UIColor *ht_btnTextColor;

@end


NS_ASSUME_NONNULL_END
