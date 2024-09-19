//
//  HTPlayerTitleView.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTPlayerTitleView.h"

@interface HTPlayerTitleView ()

@property (nonatomic, strong) UIButton * backButton;
@property (nonatomic, strong) UILabel * titleLabel;

@end
@implementation HTPlayerTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor redColor];
        [self addSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self makeConstraintsForUI];
}

#pragma mark - add subviews

- (void)addSubviews {
    
    [self addSubview:self.backButton];
    [self addSubview:self.titleLabel];
}

#pragma mark - make constraints

- (void)makeConstraintsForUI {
        
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(@30);
        make.top.mas_equalTo(@0);
        make.left.mas_equalTo(@10);
        make.bottom.mas_equalTo(@0);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(@0);
        make.left.mas_equalTo(@45);
        make.bottom.mas_equalTo(@0);
        make.right.mas_equalTo(@-15);
    }];
}

- (void)ht_showBackButton {
    
    _backButton.hidden = NO;
}

- (void)ht_hideBackButton {
    
    _backButton.hidden = YES;
}

#pragma mark - button event

- (void)clickBackButton:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ht_titleViewDidExitFullScreen:)]) {
        
        [self.delegate ht_titleViewDidExitFullScreen:self];
    }
}

#pragma mark - setter and getter

- (UIButton *)backButton {
    
    if (!_backButton) {
        
        UIButton * backButton = [[UIButton alloc] init];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
        backButton.hidden = YES;
        _backButton = backButton;
    }
    return _backButton;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        
        UILabel * titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    _titleLabel.text = _title;
}

@end
