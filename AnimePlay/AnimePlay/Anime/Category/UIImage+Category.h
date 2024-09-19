//
//  UIImage+Category.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)
//由颜色生成图片
+ (UIImage *)ht_imageWithColor:(UIColor*)color;
+ (UIImage *)ht_imageWithColor:(UIColor *)color size:(CGSize)size;

//绘图
- (UIImage*)ht_imageChangeColor:(UIColor*)color;
@end

NS_ASSUME_NONNULL_END
