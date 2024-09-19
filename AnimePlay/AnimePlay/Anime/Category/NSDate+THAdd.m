//
//  NSDate+THAdd.m
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import "NSDate+THAdd.h"

@implementation NSDate (THAdd)

// MARK: 获取当前时间戳
+ (NSString *)ht_GetNowTimeTimestamp {
   NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;

    [formatter setDateStyle:NSDateFormatterMediumStyle];

    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    //设置时区,这个对于时间的处理有时很重要

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];

    [formatter setTimeZone:timeZone];

    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];

    return timeSp;
}
+ (NSString *)ht_GetNowTimeTimestampEr {
   NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;

    [formatter setDateStyle:NSDateFormatterMediumStyle];

    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    //设置时区,这个对于时间的处理有时很重要

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];

    [formatter setTimeZone:timeZone];

    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];

    return timeSp;
}


// MARK:  获取持续时间总长
+ (NSString *)ht_TotalDuration:(NSInteger)minutes{
    NSInteger duration = minutes;
    if (duration < 0) {
        duration = 0;
    }
    NSString *durationStr = @"0分";
    if (duration < 60) {
        durationStr = [NSString stringWithFormat:@"%ld分",(long)duration];
    } else {
        if (duration % 60 == 0) {
            NSInteger NUIntHour = duration/60;
            durationStr = [NSString stringWithFormat:@"%ld時",(long)NUIntHour];
        } else {
            NSInteger NUIntHour = (NSInteger)duration/60;
            NSInteger minute = (duration - NUIntHour*60);
            durationStr = [NSString stringWithFormat:@"%ld時%ld分",(long)NUIntHour,minute];
        }
    }
    return durationStr;
}
// MARK: 格式化持续时间
+ (NSString *)ht_TotalFormatDuration:(NSInteger)minutes{
    NSInteger duration = minutes;
    if (duration < 0) {
        duration = 0;
    }
    NSString *durationStr = @"00:00";
    if (duration < 60) {
        durationStr = [NSString stringWithFormat:@"00:%@",[self ht_getFillNumber:duration]];

    } else {
        if (duration % 60 == 0) {
            NSInteger NUIntHour = duration/60;
            durationStr = [NSString stringWithFormat:@"%@:00",[self ht_getFillNumber:NUIntHour]];
            
        } else {
            NSInteger NUIntHour = (NSInteger)duration/60;
            NSInteger minute = (duration - NUIntHour*60);
            durationStr = [NSString stringWithFormat:@"%@:%@",[self ht_getFillNumber:NUIntHour],[self ht_getFillNumber:minute]];
        }
    }
    return durationStr;
}

// MARK: 数值填充补位
+(NSString *)ht_getFillNumber:(NSInteger)num{
    if(num>=10){
        return  HTString(@"%ld",num);
    }else{
        return  HTString(@"0%ld",num);
    }
}

/**
 * 將毫秒轉換成時間字符串
 */
+ (NSString *)ht_MSTimeFromDateFormat:(NSInteger)time{
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString*timeString=[formatter stringFromDate:d];
    return timeString;
}
// MARK: 将时间毫秒转成 yyyy-MM-dd
+ (NSString *)ht_MSTimeFromYYFormat:(NSInteger)time{
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString*timeString=[formatter stringFromDate:d];
    return timeString;
}

// MARK: 将时间毫秒转成 HH:mm
+ (NSString *)ht_MSTimeFromHHFormat:(NSInteger)time{
    NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString*timeString=[formatter stringFromDate:d];
    return timeString;
}

// (Timestamp => TimeString)
+ (NSString *)timeStringFromTimestamp:(NSInteger)timestamp formatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *timeDate = [self dateFromTimestamp:timestamp];
    return [formatter stringFromDate:timeDate];
}
// (Timestamp => NSDate)
+ (NSDate *)dateFromTimestamp:(NSInteger)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}




@end

