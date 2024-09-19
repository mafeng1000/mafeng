//
//  HTLanguageManager.h
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import <Foundation/Foundation.h>

extern NSString * _Nonnull const languageFileKey;

static NSString * _Nonnull Spanish = @"Spanish";
static NSString * _Nonnull English     = @"en";
// 语言发生变化的通知
static NSString * _Nonnull LangChangeNotification = @"LangChangeNotification";;

NS_ASSUME_NONNULL_BEGIN

@interface HTLanguageManager : NSObject
+ (instancetype)sharedManager;
/**
 * 获取用户设置app 的当前语言
 */
+ (NSBundle *_Nonnull)localizedBundle;
/**
 * 获取用户手机系统设置的语言包，（这里根据自己的需求处理，我这里的处理是如果没有对应的语言包默认返回英文）
 */
+ (NSBundle *_Nonnull)syslocalizedBundle;

+ (NSString *_Nonnull)fetchLangFileName;

/**
 * 保存用户选择的语言
 * langFileName 语言名称
 */
+ (void)saveUserLocalLang:(NSString *_Nonnull)langFileName;
+ (NSString *)fetchSysLangName;
@end

NS_ASSUME_NONNULL_END



//// 将语言保存用户设置app 的
//#define STLANG(key) NSLocalizedStringFromTableInBundle(key, @"Localizable", [STLanguageTool localizedBundle], nil)
//
//// 和手机系统的语言保持一致
//#define STSYSLANG(key) NSLocalizedStringFromTableInBundle(key, @"Localizable", [STLanguageTool syslocalizedBundle], nil)



