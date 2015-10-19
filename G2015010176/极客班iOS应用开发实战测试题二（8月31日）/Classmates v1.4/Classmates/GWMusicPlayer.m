//
//  GWMusicPlayer.m
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWMusicPlayer.h"

@implementation GWMusicPlayer


static GWMusicPlayer *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Singleton method

+ (id)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    
    // Preparing play back use AVAudioSession
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    NSError *activeError = nil;
    if (![session setActive:YES error:&activeError])
    {
        NSLog(@"Failed to set active audio session!");
    }
    
    NSError *categoryError = nil;
    if (![session setCategory:AVAudioSessionCategoryPlayback
                        error:&categoryError])
    {
        NSLog(@"Failed to set audio category!");
    }
    
    
    return SINGLETON;
}


#pragma mark - Paly or pause method

- (void)playOrPause {
    
    NSError *playerInitError = nil;
    
    NSString *audioPath =
    [[NSBundle mainBundle] pathForResource:@"yishengsuoai"
                                    ofType:@"mp3"];
    
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:audioURL
                        error:&playerInitError];
    
    UIImage *lockImage = [UIImage imageNamed:@"artwork_yishengsuoai"];
    
    MPMediaItemArtwork *artwork =
    [[MPMediaItemArtwork alloc] initWithImage:lockImage];
    
    NSDictionary *mediaDict =
    @{
      MPMediaItemPropertyTitle: @"一生所爱",
      MPMediaItemPropertyMediaType: @(MPMediaTypeAnyAudio),
      MPMediaItemPropertyPlaybackDuration:
          @(self.audioPlayer.duration),
      MPNowPlayingInfoPropertyPlaybackRate: @1.0,
      MPNowPlayingInfoPropertyElapsedPlaybackTime:
          @(self.audioPlayer.currentTime),
      MPMediaItemPropertyAlbumArtist: @"大话西游",
      MPMediaItemPropertyArtist: @"卢冠延",
      MPMediaItemPropertyArtwork: artwork };
    
    [self.audioPlayer play];
    
    
    [[MPNowPlayingInfoCenter defaultCenter]
     setNowPlayingInfo:mediaDict];
    
    
    [[UIApplication sharedApplication]
     beginReceivingRemoteControlEvents];

}

@end
