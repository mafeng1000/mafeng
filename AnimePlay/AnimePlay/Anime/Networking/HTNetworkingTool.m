//
//  HTNetworkingTool.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTNetworkingTool.h"

//#define RequestServerError @"您的网络不稳定，请稍后重试"
#define RequestServerError @""


@implementation HTNetworkingTool


//单例
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static HTNetworkingTool *instance;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@""];
        instance = [[HTNetworkingTool alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*"]];
    });
    instance.requestSerializer = [AFJSONRequestSerializer serializer];
    
//    if ([[User getUserToken] length] != 0) {
//        NSLog(@"UserToken------%@", [User getUserToken]);
//        [instance.requestSerializer setValue:[User getUserToken] forHTTPHeaderField:@"Authorization"];
//    }else {
//        [instance.requestSerializer setValue:nil forHTTPHeaderField:@"user-token"];
//    }
    return instance;
}


//get请求
+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(responseSuccess)success failed:(responseFailed)failed IsNeedHub:(BOOL)isNeed {
    
    if (isNeed) {
        [HTTools showHud];
    }
    //    NSLog(@"----------------------%@", url);
    [[HTNetworkingTool sharedManager] GET:url
                               parameters:params
                                  headers:nil
                                 progress:nil
                                  success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        NSLog(@"%@-----%@-----%@", url, params, responseObject);
        if (isNeed) {
            [HTTools hideHud];
        }
//        if ([responseObject[@"code"] intValue] == TokenError) {
//            [User deleUser];
//            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登录已失效，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
//            [alertC addAction:[UIAlertAction actionWithTitle:@"去登录"
//                                                       style:UIAlertActionStyleDefault
//                                                     handler:^(UIAlertAction *_Nonnull action) {
//                LoginViewController *loginVC = [LoginViewController new];
//                loginVC.hidesBottomBarWhenPushed = YES;
//                [[DZTools topViewController].navigationController pushViewController:loginVC animated:YES];
//            }]];
//            [[DZTools getAppWindow].rootViewController presentViewController:alertC animated:YES completion:nil];
//        }
        //请求成功的回调
        if (success) {
            success(task, responseObject);
        }
    }
                                  failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        //请求失败的回调
        NSLog(@"%@", error);
        [HTTools jiexierrrorwitherror:error];
        [HTTools showNOHud:RequestServerError];
        id cacheData = nil;
        if (failed) {
            failed(task, error, cacheData);
        }
    }];
}

//post请求
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(responseSuccess)success failed:(responseFailed)failed IsNeedHub:(BOOL)isNeed {
    if (isNeed) {
        [HTTools showHud];
    }
    [[HTNetworkingTool sharedManager] POST:url
                                parameters:params
                                   headers:@{}
                                  progress:nil
                                   success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        NSLog(@"%@-----%@-----%@", url, params, responseObject);
        if (isNeed) {
            [HTTools hideHud];
        }
//        if ([responseObject[@"code"] intValue] == TokenError) {
//            [User deleUser];
//            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登录已失效，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
//            [alertC addAction:[UIAlertAction actionWithTitle:@"去登录"
//                                                       style:UIAlertActionStyleDefault
//                                                     handler:^(UIAlertAction *_Nonnull action) {
//                LoginViewController *loginVC = [LoginViewController new];
//                loginVC.hidesBottomBarWhenPushed = YES;
//                [[DZTools topViewController].navigationController pushViewController:loginVC animated:YES];
//            }]];
//            [[DZTools getAppWindow].rootViewController presentViewController:alertC animated:YES completion:nil];
//        }
        if (success) {
            success(task, responseObject);
        }
    }
                                   failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"%@", error);
        [HTTools jiexierrrorwitherror:error];
        [HTTools showNOHud:RequestServerError];
        id cacheData = nil;
        if (failed) {
            failed(task, error, cacheData);
        }
    }];
}






@end
