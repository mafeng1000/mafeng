//
//  NSString+HTAdd.m
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import "NSString+HTAdd.h"
#import "HTLanguageManager.h"


@implementation NSString (HTAdd)

- (NSString *)ht_localized {
    return NSLocalizedStringFromTableInBundle(self, @"Localizable", [HTLanguageManager syslocalizedBundle], nil);
//    [[HKLanguageManager sharedManager] stringForKey:self];
}

@end
