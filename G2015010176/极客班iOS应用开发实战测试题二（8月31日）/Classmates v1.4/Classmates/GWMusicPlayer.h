//
//  GWMusicPlayer.h
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface GWMusicPlayer : NSObject

/**
 *  A instance variable of AVAudioPlayer to play music
 */
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;



/**
 *  Play the audio or pause
 *
 *  @param audioURL  The URL of "audio" that to palying
 *  @param mediaDic  The media information of "audio" that to palying
 *
 *  @return A flag to show playing or not
 */
- (void)playOrPause;

/**
 * Singleton method.
 * @return singleton
 */
+ (GWMusicPlayer *)sharedInstance;


@end
