//
//  HTBaseViewController.h
//  AnimePlay
//
//  Created by MAC on 2024/9/17.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(int, HTCustomNavigationTitleViewAlignment) {
    /// 导航标题内容居左
    HTCustomNavigationTitleViewAlignmentLeft = 0,
    /// 导航标题内容居中
    HTCustomNavigationTitleViewAlignmentCenter = 1
};


NS_ASSUME_NONNULL_BEGIN

@interface HTBaseViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
