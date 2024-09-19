//
//  HTNetworkingTool.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTNetworkingTool.h"
#import "HTLanguageManager.h"
#import <AdSupport/AdSupport.h>


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
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*",@"text/html"]];
    });
    instance.requestSerializer = [AFJSONRequestSerializer serializer];
//    instance.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    if ([[User getUserToken] length] != 0) {
//        NSLog(@"UserToken------%@", [User getUserToken]);
//        [instance.requestSerializer setValue:[User getUserToken] forHTTPHeaderField:@"Authorization"];
//    }else {
//        [instance.requestSerializer setValue:nil forHTTPHeaderField:@"user-token"];
//    }
    return instance;
}
//获取当前app版本号
+ (NSString *) getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // 当前应用软件版本  比如：1.0.1
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // 当前应用版本号码  int类型
    //    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"当前应用版本号码：%@",appCurVersion);
    return appCurVersion;
}

+(NSString *)ht_dealUrl:(NSString *)url
{
    NSString *newurl = [NSString stringWithFormat:@"%@%@%@",HT_CONFIG_DOMIAN,HT_CONFIG_DOMIAN_default,url];
    return newurl;
}
+(NSDictionary *)ht_commonHeader
{
    NSMutableDictionary *dictNew = [[NSMutableDictionary alloc]init];
    [dictNew setValue:@"Apifox/1.0.0 (https://apifox.com)" forKey:@"User-Agent"];
    [dictNew setValue:@"*/*" forKey:@"Accept"];
//    [dictNew setValue:@"www.devapitest.top" forKey:@"Host"];

//    [dictNew setValue:@"Apifox/1.0.0 (https://apifox.com)" forKey:@"User-Agent"];
//    [dictNew setValue:@"Apifox/1.0.0 (https://apifox.com)" forKey:@"User-Agent"];
//    [dictNew setValue:@"Apifox/1.0.0 (https://apifox.com)" forKey:@"User-Agent"];
//    [dictNew setValue:@"Apifox/1.0.0 (https://apifox.com)" forKey:@"User-Agent"];
//    [dictNew setValue:@"Apifox/1.0.0 (https://apifox.com)" forKey:@"User-Agent"];

    return  dictNew;
}


+(NSDictionary *)ht_commonParameter:(NSDictionary *)params
{
    
    NSMutableDictionary *dictNew = [[NSMutableDictionary alloc]initWithDictionary:params];
    [dictNew setValue:@"8a983582effc3d97a8a8333eeeb790e187c2caeb3c3f88a48cd18ae7c84a3d93" forKey:@"apns_id"];
    [dictNew setValue:HT_CONFIG_app_id forKey:@"app_id"];
    [dictNew setValue:[self getAppVersion] forKey:@"app_ver"];
    [dictNew setValue:@"iPhone" forKey:@"brand"];
    [dictNew setValue:@"US" forKey:@"country"];
    [dictNew setValue:@"iOS" forKey:@"device"];
    [dictNew setValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:@"deviceNo"];
    [dictNew setValue:[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] forKey:@"idfa"];
    [dictNew setValue:@"51502" forKey:@"imsi"];
    [dictNew setValue:@"1685543382" forKey:@"installTime"];
    [dictNew setValue:[HTLanguageManager fetchSysLangName] forKey:@"lang"];
    [dictNew setValue:@"iPhone10" forKey:@"model"];
    [dictNew setValue:@"16.1" forKey:@"os_ver"];
    [dictNew setValue:@"dmE9TwyaLoyzTk1tTkdeMvE1Vw1eTk1p" forKey:@"sig2"];
    [dictNew setValue:[NSDate ht_GetNowTimeTimestampEr] forKey:@"unixtime1"];
    
    
    [dictNew setValue:@"0" forKey:@"r1"];
    [dictNew setValue:@"0" forKey:@"reg_id"];
    [dictNew setValue:@"1125x2436" forKey:@"resolution"];
    [dictNew setValue:@"1" forKey:@"simcard"];
    [dictNew setValue:@"8" forKey:@"timezone"];
    [dictNew setValue:@"1" forKey:@"token"];
    [dictNew setValue:@"1" forKey:@"vp"];
    return dictNew;
}
//get请求
+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params success:(responseSuccess)success failed:(responseFailed)failed IsNeedHub:(BOOL)isNeed {
    url = [self ht_dealUrl:url];
    
    params = [self ht_commonParameter:params];
    if (isNeed) {
        [HTTools showHud];
    }
    //    NSLog(@"----------------------%@", url);
    [[HTNetworkingTool sharedManager] GET:url
                               parameters:params
                                  headers:[self ht_commonHeader]
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
- (void)postWithUrl:(NSString *)url body:(NSData *)body success:(responseSuccess)success failure:(responseFailed)failure {
        
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    request.timeoutInterval = 30;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"Apifox/1.0.0 (https://apifox.com)" forHTTPHeaderField:@"User-Agent"];

    // 设置body
    [request setHTTPBody:body];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    [[manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
                
            } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
                
            } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                NSString * str  =[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSLog(@"%@", str);

                

            }] resume];
//    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        if (error) {
//            failure(error);
//        } else {
//            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//            success(json);
//        }
//    }] resume];
}




//post请求
+ (void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(responseSuccess)success failed:(responseFailed)failed IsNeedHub:(BOOL)isNeed 
{
    
    url = [self ht_dealUrl:url];
//    if (isNeed) {
//        [HTTools showHud];
//    }
    
    params = [self ht_commonParameter:params];
    NSData *data =    [NSJSONSerialization dataWithJSONObject:params options:NSUTF8StringEncoding error:nil];
    
    [[HTNetworkingTool sharedManager] postWithUrl:url body:data success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error, id  _Nullable responseObject) {
            
        }];
}






@end
