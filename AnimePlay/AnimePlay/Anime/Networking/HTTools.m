//
//  HTTools.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTTools.h"

@implementation HTTools
#pragma mark - MBProgressHUD
+ (void)showHud
{
//    [MBProgressHUD showMessage:@"" ToView:nil];
}
+ (void)showText:(NSString *)text{
//    [MBProgressHUD showMessage:text ToView:nil];
}
+ (void)showText:(NSString *)text delay:(NSTimeInterval)dalay
{
//    [MBProgressHUD showMessage:text ToView:nil RemainTime:dalay];
}
+ (void)showTextHud:(NSString *)text
{
//    [MBProgressHUD showMessage:text ToView:nil];
}
+ (void)showOKHud:(NSString *)text
{
//    [MBProgressHUD showSuccess:text ToView:nil delay:1.5];
}
+ (void)showOKHud:(NSString *)text delay:(NSTimeInterval)dalay
{
//    [MBProgressHUD showSuccess:text ToView:nil delay:dalay];
}
+ (void)showNOHud:(NSString *)text
{
//    [MBProgressHUD showError:text ToView:nil delay:1.5];
}
+ (void)showNOHud:(NSString *)text delay:(NSTimeInterval)dalay
{
//    [MBProgressHUD showError:text ToView:nil delay:dalay];
}
+ (void)showAnimated:(NSString *)imageName Text:(NSString *)text delay:(NSTimeInterval)dalay
{
//    [MBProgressHUD showCustomIcon:imageName Title:text ToView:nil delay:dalay];
}
+ (void)hideHud
{
//    [MBProgressHUD hideHUD];
}
+ (void)jiexierrrorwitherror:(NSError *)error{
//    NSDictionary *response;
//    @try {
//         response = [NSJSONSerialization JSONObjectWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] options:0 error:nil];
//    } @catch (NSException *exception) {
//        return;
//    } @finally {
//        // 错误码
//        if ([response[@"code"] intValue] == TokenError) {
//            [User deleUser];
//            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"登录已失效，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
//            [alertC addAction:[UIAlertAction actionWithTitle:@"去登录"
//                                                       style:UIAlertActionStyleDefault
//                                                     handler:^(UIAlertAction *_Nonnull action) {
//                                                         LoginViewController *loginVC = [LoginViewController new];
//                                                         loginVC.hidesBottomBarWhenPushed = YES;
//                                                         [[DZTools topViewController].navigationController pushViewController:loginVC animated:YES];
//                                                     }]];
//            [[DZTools getAppWindow].rootViewController presentViewController:alertC animated:YES completion:nil];
//            return;
//        }
//    }
}
@end
