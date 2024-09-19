//
//  HTHomeSanCellCell.m
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import "HTHomeSanCellCell.h"
@interface HTHomeSanCellCell ()

@property(nonatomic,strong)UIView   *htContentView;
@property(nonatomic,strong)UIImageView   *backImageV;
@property(nonatomic,strong)UILabel   *ageLabel;
@property(nonatomic,strong)UILabel   *bumberLabel;
@property(nonatomic,strong)UILabel   *titleLabel;
@property(nonatomic,strong)UILabel   *moneyLabel;
@property(nonatomic,strong)UILabel   *addButton;


@end
@implementation HTHomeSanCellCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.htContentView = [[UIView alloc]init];
        [self addSubview:self.htContentView];
        [self.htContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        self.backImageV = [[UIImageView alloc]init];
        [self.htContentView addSubview:self.backImageV];
        [self.backImageV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.left.right.mas_equalTo(0);
                    make.height.mas_equalTo(160);
        }];
    }
    return self;
}

@end
