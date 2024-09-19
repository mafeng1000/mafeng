//
//  HTCommonDefine.h
//  AnimePlay
//
//  Created by MAC on 2024/9/17.
//

#ifndef HTCommonDefine_h
#define HTCommonDefine_h

#pragma mark - Screen Size
#define HT_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define HT_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define HT_SCREEN_SCALE ([UIScreen mainScreen].scale)

// MARK: 快速创建String
#define HTString(...) [NSString stringWithFormat:__VA_ARGS__]

#pragma mark - System Version

#define HT_IOS_SYSTEM_VERSION_GREATER_THAN(v)                                                                          \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define HT_IOS_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)                                                              \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define HT_IOS_SYSTEM_VERSION_LESS_THAN(v)                                                                             \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
/**-------颜色--------*/
#define HTUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HTUIColorWithRGB(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define HTRGB(R,G,B)  [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:1.0]
#define HTRGBA(R,G,B,A)  [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:A]

#define HTMainColor HTUIColorFromRGB(0xFFFFFF)
#define HTMainTextColor HTUIColorFromRGB(0x393939)
#define HTMainSelectTextColor HTUIColorFromRGB(0xFF6C3C)




#endif /* HTCommonDefine_h */
