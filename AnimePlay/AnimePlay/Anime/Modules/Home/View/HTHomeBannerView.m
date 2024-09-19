//
//  HTHomeBannerView.m
//  AnimePlay
//
//  Created by MAC on 2024/9/19.
//

#import "HTHomeBannerView.h"
#import "CWCarouselHeader.h"

@interface HTHomeBannerView ()<CWCarouselDatasource,CWCarouselDelegate>

@property(nonatomic,strong)CWCarousel *bannerView;

@end



@implementation HTHomeBannerView

-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, 0, HT_SCREEN_WIDTH, 220);
        // egg:
        CWFlowLayout *flowLayout = [[CWFlowLayout alloc] initWithStyle:CWCarouselStyle_H_2];
        self.bannerView = [[CWCarousel alloc]initWithFrame:CGRectMake(0, 0, HT_SCREEN_WIDTH, 220) delegate:self datasource:self flowLayout:flowLayout];
        [self addSubview:self.bannerView];
    }
    return self;
}

- (NSInteger)numbersForCarousel { 
    return 3;
}

- (UICollectionViewCell *)viewForCarousel:(CWCarousel *)carousel indexPath:(NSIndexPath *)indexPath index:(NSInteger)index { 
    return [UICollectionViewCell new];
}



- (void)CWCarousel:(CWCarousel *)carousel didSelectedAtIndex:(NSInteger)index { 
    
}


@end
