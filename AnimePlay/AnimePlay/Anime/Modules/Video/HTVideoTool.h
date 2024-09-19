//
//  HTVideoTool.h
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import <Foundation/Foundation.h>

typedef void(^ConvertBlock)(NSString * _Nonnull path);
typedef void(^Convertfail)(void);

NS_ASSUME_NONNULL_BEGIN

@interface HTVideoTool : NSObject
+ (void)ht_deleteTemVieoAtPath:(NSString*)path;
+ (UIImage *)ht_firstFrameWithVideoURL:(NSURL *)url size:(CGSize)size;
+ (void)ht_convertMOVToMp4:(NSURL*)path success:(ConvertBlock)block fail:(Convertfail)fail;
@end

NS_ASSUME_NONNULL_END
