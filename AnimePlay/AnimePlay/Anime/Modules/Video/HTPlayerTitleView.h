//
//  HTPlayerTitleView.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HTPlayerTitleViewDelegate;
@interface HTPlayerTitleView : UIView

@property (nonatomic, weak) id<HTPlayerTitleViewDelegate> delegate;
@property (nonatomic, copy) NSString * title;

- (void)ht_showBackButton;
- (void)ht_hideBackButton;
@end
@protocol HTPlayerTitleViewDelegate <NSObject>

@optional
- (void)ht_titleViewDidExitFullScreen:(HTPlayerTitleView *)titleView;
@end

NS_ASSUME_NONNULL_END
