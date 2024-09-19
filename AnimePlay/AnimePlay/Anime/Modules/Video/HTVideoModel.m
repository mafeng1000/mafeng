//
//  HTVideoModel.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTVideoModel.h"


@interface HTVideoModel ()

@property (nonatomic, copy) NSString * sdUrl;
@property (nonatomic, copy) NSString * hdUrl;

@end
@implementation HTVideoModel

- (instancetype)initWithVideoId:(NSString *)videoId title:(NSString *)title videoPath:(NSString *)videoPath currentTime:(NSTimeInterval)currentTime {
    
    self = [super init];
    
    if (self) {
        
        _videoId = [videoId copy];
        _title = [title copy];
        _currentTime = currentTime;
        _url = [[NSURL fileURLWithPath:videoPath] copy];
        _style = HTVideoPlayStyleLocal;
    }
    return self;
}

- (instancetype)initWithVideoId:(NSString *)videoId title:(NSString *)title url:(NSString *)url currentTime:(NSTimeInterval)currentTime {
    
    self = [super init];
    
    if (self) {
        
        _videoId = [videoId copy];
        _title = [title copy];
        _currentTime = currentTime;
        _url = [[NSURL URLWithString:url] copy];
        _style = HTVideoPlayStyleNetwork;
    }
    return self;
}

- (instancetype)initWithVideoId:(NSString *)videoId title:(NSString *)title sdUrl:(NSString *)sdUrl hdUrl:(NSString *)hdUrl currentTime:(NSTimeInterval)currentTime {
    
    self = [super init];
    
    if (self) {
        
        _videoId = [videoId copy];
        _title = [title copy];
        _currentTime = currentTime;
        _sdUrl = [sdUrl copy];
        _hdUrl = [hdUrl copy];
        self.style = HTVideoPlayStyleNetworkHD;
    }
    return self;
}

- (void)setStyle:(HTVideoPlayStyle)style {
    
    _style = style;
    
    if (_style == HTVideoPlayStyleNetworkSD) {
        
        _url = [[NSURL URLWithString:_sdUrl] copy];
        NSLog(@"%@", _sdUrl);
    } else if (_style == HTVideoPlayStyleNetworkHD) {
        
        _url = [[NSURL URLWithString:_hdUrl] copy];
        NSLog(@"%@", _hdUrl);
    }
}

@end

