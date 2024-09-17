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


#pragma mark - System Version

#define HT_IOS_SYSTEM_VERSION_GREATER_THAN(v)                                                                          \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define HT_IOS_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)                                                              \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define HT_IOS_SYSTEM_VERSION_LESS_THAN(v)                                                                             \
    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


#endif /* HTCommonDefine_h */
