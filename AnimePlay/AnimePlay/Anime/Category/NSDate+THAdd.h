//
//  NSDate+THAdd.h
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (THAdd)
/** 获取当前时间戳字符串 */
+ (NSString *)ht_GetNowTimeTimestamp;
/** 获取当前时间戳字符串 */
+ (NSString *)ht_GetNowTimeTimestampEr;

/** 获取持续时间总长 */
+ (NSString *)ht_TotalDuration:(NSInteger)minutes;
/** 获取持续格式化时间总长 */
+ (NSString *)ht_TotalFormatDuration:(NSInteger)minutes;

/** 毫秒转时间 */
+ (NSString *)ht_MSTimeFromDateFormat:(NSInteger)time;
/** 将时间毫秒转成 HH:mm */
+ (NSString *)ht_MSTimeFromHHFormat:(NSInteger)time;
/** 将时间毫秒转成 yyyy-MM-dd */
+ (NSString *)ht_MSTimeFromYYFormat:(NSInteger)time;


@end

NS_ASSUME_NONNULL_END
