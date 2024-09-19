//
//  HTUserInfoManager.h
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, HTQuantityType) {
    HTQuantityTypeNone,
    HTQuantityTypeVideo,
    HTQuantityTypeCartoon,
    HTQuantityTypeIPTV
};

NS_ASSUME_NONNULL_BEGIN

@interface HTUserInfoManager : NSObject
@property (nonatomic , strong) NSString              * userToken;
@property (nonatomic , assign) HTQuantityType              * quantityType;


+ (instancetype)sharedInstance;
+(void)ht_clearUserInfo;

@end

NS_ASSUME_NONNULL_END
