//
//  HTPlayerLayerView.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTPlayerLayerView.h"

@interface HTPlayerLayerView ()

@property (nonatomic, strong) AVPlayerLayer * playerLayer;
@end
@implementation HTPlayerLayerView

- (void)ht_addPlayerLayer:(AVPlayerLayer *)playerLayer {
    
    _playerLayer = playerLayer;
    playerLayer.backgroundColor = [UIColor blackColor].CGColor;
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    _playerLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:_playerLayer];
}



- (void)layoutSublayersOfLayer:(CALayer *)layer {
    
    [super layoutSublayersOfLayer:layer];
    
    _playerLayer.frame = self.bounds;
}

@end
