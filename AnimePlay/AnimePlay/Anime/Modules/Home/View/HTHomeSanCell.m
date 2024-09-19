//
//  HTHomeSanCell.m
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import "HTHomeSanCell.h"
#import "HTHomeSanCellCell.h"


@interface HTHomeSanCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView   *collectionView;
@property(nonatomic,strong)NSMutableArray   *dataArray;

@end

@implementation HTHomeSanCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = HTMainColor;
        [self.contentView addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.left.right.equalTo(self).offset(0);
            make.height.mas_equalTo(220);
        }];


    }
    return self;
}
-(void)relaoDataArray:(NSArray *)dataArray
{
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:dataArray];
    [self.collectionView reloadData];
}


-(UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [self nm_initializationFlowLayout];
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0,0,30 ,30) collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor =[UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[HTHomeSanCellCell class] forCellWithReuseIdentifier:@"HTHomeSanCellCell"];
    }
    return _collectionView;
}
-(UICollectionViewFlowLayout *)nm_initializationFlowLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing =0;
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake((HT_SCREEN_WIDTH - 50)/3.0, 220);
    layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    return layout;
}

#pragma mark collection data source
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HTHomeSanCellCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HTHomeSanCellCell" forIndexPath:indexPath];
    return cell;

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}


@end



