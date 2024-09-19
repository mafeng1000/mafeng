//
//  HTUserInfoManager.m
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import "HTUserInfoManager.h"

@implementation HTUserInfoManager

static dispatch_once_t userInfoOnce;

- (instancetype)sharedInstance {
    return [[self class] sharedInstance];
}

+ (instancetype)sharedInstance {
    static id __singleton__;
    dispatch_once( &userInfoOnce, ^{
        
    });
    return __singleton__;
}

+ (void)ht_clearUserInfo {
}


@end

