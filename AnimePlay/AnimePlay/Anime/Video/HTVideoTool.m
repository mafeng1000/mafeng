//
//  HTVideoTool.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTVideoTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation HTVideoTool
+ (UIImage *)ht_firstFrameWithVideoURL:(NSURL *)url size:(CGSize)size
{
    // 获取视频第一帧
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(size.width, size.height);
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(0, 10) actualTime:NULL error:&error];
    {
        return [UIImage imageWithCGImage:img];
    }
    return nil;
}
+(void)ht_deleteTemVieoAtPath:(NSString*)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        [fileManager removeItemAtPath:path error:nil];
        NSLog(@"remove success");
    }
}
+(void)ht_convertMOVToMp4:(NSURL*)path success:(ConvertBlock)block fail:(Convertfail)fail{
    AVURLAsset *avAsset = [AVURLAsset URLAssetWithURL:path options:nil];
    NSArray *compatiblePresets = [AVAssetExportSession exportPresetsCompatibleWithAsset:avAsset];
    
    if ([compatiblePresets containsObject:AVAssetExportPresetLowQuality])
        
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *nowTimeStr = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]initWithAsset:avAsset presetName:AVAssetExportPresetPassthrough];
        NSString *exportPath = [NSString stringWithFormat:@"%@/%@.mp4",
                                [NSHomeDirectory() stringByAppendingString:@"/tmp"],
                                nowTimeStr];
        exportSession.outputURL = [NSURL fileURLWithPath:exportPath];
        NSLog(@"%@", exportPath);
        exportSession.outputFileType = AVFileTypeMPEG4;
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            
            switch ([exportSession status]) {
                case AVAssetExportSessionStatusFailed:
                    NSLog(@"Export failed: %@", [[exportSession error] localizedDescription]);
                    if (fail) {
                        fail();
                    }
                    break;
                case AVAssetExportSessionStatusCancelled:
                    NSLog(@"Export canceled");
                    if (fail) {
                        fail();
                    }
                    break;
                case AVAssetExportSessionStatusCompleted:
                    if (block) {
                        block(exportPath);
                    }
                    NSLog(@"转换成功");
                    break;
                default:
                    break;
            }
        }];
    }
}
@end
