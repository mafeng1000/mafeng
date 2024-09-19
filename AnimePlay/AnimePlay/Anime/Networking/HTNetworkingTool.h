//
//  HTNetworkingTool.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "HTTools.h"


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
