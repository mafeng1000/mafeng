//
//  HTPlayerFailedView.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HTPlayerFailedViewDelegate;

@interface HTPlayerFailedView : UIView
@property (nonatomic, weak) id<HTPlayerFailedViewDelegate> delegate;


@end


@protocol HTPlayerFailedViewDelegate <NSObject>

@optional
- (void)ht_failedViewDidReplay:(HTPlayerFailedView *)failedView;
@end


NS_ASSUME_NONNULL_END
