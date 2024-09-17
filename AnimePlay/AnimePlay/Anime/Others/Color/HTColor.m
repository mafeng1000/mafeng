//
//  HTColor.m
//  AnimePlay
//
//  Created by MAC on 2024/9/17.
//

#import "HTColor.h"

@implementation HTColor

+ (UIColor * _Nonnull (^)(NSString * _Nonnull))ht_colorWithHexString {
    return ^UIColor * _Nonnull (NSString * _Nonnull hexString) {
        //删除字符串中的空格
        NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        // String should be 6 or 8 characters
        if ([cString length] < 6)
        {
            return [UIColor clearColor];
        }
        // strip 0X if it appears
        //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
        if ([cString hasPrefix:@"0X"])
        {
            cString = [cString substringFromIndex:2];
        }
        //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
        if ([cString hasPrefix:@"#"])
        {
            cString = [cString substringFromIndex:1];
        }
        if ([cString length] == 7 || [cString length] > 8)
        {
            return [UIColor clearColor];
        }
        // Separate into r, g, b substrings
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *aString = @"ff";
        if (cString.length == 8) {
            aString = [cString substringWithRange:range];
            range.location += 2;
        }
        //r
        NSString *rString = [cString substringWithRange:range];
        //g
        range.location += 2;
        NSString *gString = [cString substringWithRange:range];
        //b
        range.location += 2;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b, a;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        [[NSScanner scannerWithString:aString] scanHexInt:&a];
        return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:a/255.f];
    };
}

+ (UIColor * _Nonnull (^)(CGFloat, CGFloat, CGFloat))ht_RGB {
    return ^UIColor * _Nonnull (CGFloat r, CGFloat g, CGFloat b) {
        UIColor *color = [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
        return color;
    };
}

+ (UIColor * _Nonnull (^)(CGFloat, CGFloat, CGFloat,CGFloat))ht_RGBA {
    return ^UIColor * _Nonnull (CGFloat r, CGFloat g, CGFloat b, CGFloat a) {
        UIColor *color = [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
        return color;
    };
}

+ (UIColor *(^)(UIColor *,CGFloat))ht_colorChangeAlpha {
    return ^UIColor * _Nonnull (UIColor *color, CGFloat a) {
        CGFloat red = 0.0;
        CGFloat green = 0.0;
        CGFloat blue = 0.0;
        CGFloat alpha = 0.0;
        BOOL success = [color getRed:&red green:&green blue:&blue alpha:&alpha];
        UIColor *returnColor = nil;
        if (success) {
            returnColor = [UIColor colorWithRed:red green:green blue:blue alpha:a];
        }else{
            returnColor = color;
        }
        return returnColor;
    };
}

+ (UIColor *)ht_randomColor {
    return [UIColor colorWithHue:(rand() / (CGFloat)RAND_MAX) saturation:1.0 brightness:1.0 alpha:0.25];
}

+ (UIColor *)ht_whiteColor {
    return HTColor.ht_RGB(255,255,255);
}

+ (UIColor *)ht_blackColor {
    return HTColor.ht_RGB(0,0,0);
}

+ (UIColor *)ht_backGroundColor{
    return HTColor.ht_RGB(255,255,255);
}

+ (UIColor *)ht_themeColor{
    return HTColor.ht_RGB(255,255,255);
}

+ (UIColor *)ht_textColor{
    return HTColor.ht_RGB(255,255,255);
}

+ (UIColor *)ht_navigationBarColor {
    return HTColor.ht_RGB(255,255,255);
}

+ (UIColor *)ht_btnTextColor {
    return HTColor.ht_RGB(255,255,255);
}
@end

