//
//  HTPlayerFailedView.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTPlayerFailedView.h"

@interface HTPlayerFailedView ()

@property (nonatomic, strong) UIButton * reloadButton;

@end
@implementation HTPlayerFailedView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews {
    
    [self addSubview:self.reloadButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(@40);
        make.left.mas_equalTo(@0);
        make.right.mas_equalTo(@0);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
}

- (void)clickReloadButton:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ht_failedViewDidReplay:)]) {
        
        [self.delegate ht_failedViewDidReplay:self];
    }
}

- (UIButton *)reloadButton {
    
    if (!_reloadButton) {
        
        UIButton * button = [[UIButton alloc] init];
        [button setTitle:@"视频加载失败，点击重新加载" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickReloadButton:) forControlEvents:UIControlEventTouchUpInside];
        _reloadButton = button;
    }
    return _reloadButton;
}






@end
