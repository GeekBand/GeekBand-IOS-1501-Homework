//
//  GWMVPlayingViewController.m
//  Classmates
//
//  Created by Will Ge on 9/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWMVPlayingViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface GWMVPlayingViewController ()

@property (nonatomic, strong) AVPlayerLayer           *avplayerLayer;
@property (nonatomic, strong) AVPlayer                *avplayer;

@property (nonatomic, strong) MPMoviePlayerController *player;

@end

@implementation GWMVPlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Adjust to different screen sizes
    CGFloat screenwidth  = [UIScreen mainScreen].bounds.size.width;
    CGFloat playerwidth  = screenwidth;
    CGFloat playerheight = playerwidth * 9 / 16;
    
    
    // 1 - Setup AVPlayerLayer
    NSString *path = [[NSBundle mainBundle] pathForResource:@"yishengsuoai_720p" ofType:@"mp4"];
    NSURL *URL = [[NSURL alloc] initFileURLWithPath:path];
    
    self.avplayer = [AVPlayer playerWithURL:URL];
    self.avplayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;

    
    self.avplayerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avplayer];
    self.avplayerLayer.frame = CGRectMake(0, 64, playerwidth, playerheight);
    self.avplayerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    
    [self.view.layer addSublayer:self.avplayerLayer];
    
    [self.avplayer play];
    
    // 2 - Setup MPMoviePlayerController
    NSString *mediaPath = [[NSBundle mainBundle] pathForResource:@"yishengsuoai_720p" ofType:@"mp4"];
    NSURL *mediaURL = [[NSURL alloc] initFileURLWithPath:mediaPath];
    
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:mediaURL];
    
    [self.player prepareToPlay];
    [self.player.view setFrame:CGRectMake(0, 64 + playerheight, playerwidth, playerheight)];
    [self.view addSubview:self.player.view];
    
    [self.player play];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
