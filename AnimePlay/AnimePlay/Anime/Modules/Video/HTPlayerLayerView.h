//
//  HTPlayerLayerView.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTPlayerLayerView : UIView
- (void)ht_addPlayerLayer:(AVPlayerLayer *)playerLayer;
@end

NS_ASSUME_NONNULL_END
