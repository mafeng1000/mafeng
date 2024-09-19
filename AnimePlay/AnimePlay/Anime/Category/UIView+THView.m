//
//  UIView+THView.m
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import "UIView+THView.h"

@implementation UIView (THView)
#pragma mark - 快速添加阴影
- (void)ht_addProjectionWithShadowOpacity:(CGFloat)shadowOpacity {
    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移2，y向下偏移6，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = shadowOpacity;//阴影透明度，默认0
    self.layer.shadowRadius = 3;//阴影半径，默认3
}
- (void)ht_addBorderWithWidth:(CGFloat)width {
    self.layer.borderWidth = width;
    self.layer.borderColor = [UIColor blackColor].CGColor;
}
- (void)ht_addBorderWithWidth:(CGFloat)width borderColor:(UIColor *)borderColor {
    self.layer.borderWidth = width;
    self.layer.borderColor = borderColor.CGColor;
}
- (void)ht_addRoundedCornersWithRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}
- (void)ht_addRoundedCornersWithRadius:(CGFloat)radius byRoundingCorners:(UIRectCorner)corners{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
@end

