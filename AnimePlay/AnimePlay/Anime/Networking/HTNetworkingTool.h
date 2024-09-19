//
//  HTNetworkingTool.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "HTTools.h"
#define HT_CONFIG_DOMIAN       @"http://www.devapitest.top/"
#define HT_CONFIG_DOMIAN_default       @""
//http://www.devapitest.top/264/

//#define HT_CONFIG_DOMIAN_default       @"2313725-1928539-default/"

//http://www.devapitest.top/264/

//80:   http://www.devapitest.top/
//81:   http://www.devapitest.top:81/

#define HT_CONFIG_app_id       @"93"//app编号，测试用96  93


//请求成功的回调block
typedef void(^responseSuccess)(NSURLSessionDataTask * _Nullable task, id _Nullable  responseObject);

//请求失败的回调block
typedef void(^responseFailed)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error,id _Nullable responseObject);

NS_ASSUME_NONNULL_BEGIN

@interface HTNetworkingTool : AFHTTPSessionManager<NSURLSessionDownloadDelegate>


/**
 管理者单例

 */
+ (instancetype)sharedManager;


/**
 get请求

 @param url 请求url
 @param params 参数
 @param success 成功回调
 @param failed 失败回调
 */
+ (void)getWithUrl: (NSString *)url params: (NSDictionary *)params success: (responseSuccess)success failed: (responseFailed)failed IsNeedHub:(BOOL)isNeed;


/**
 post请求

 @param url 请求url
 @param params 参数
 @param success 成功回调
 @param failed 失败回调
 */
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(responseSuccess)success failed:(responseFailed)failed IsNeedHub:(BOOL)isNeed;


@end

NS_ASSUME_NONNULL_END
