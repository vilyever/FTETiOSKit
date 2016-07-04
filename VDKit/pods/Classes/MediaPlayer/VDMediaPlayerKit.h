//
//  VDMediaPlayerKit.h
//  VDKit
//
//  Created by FTET on 15/3/11.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MediaPlayer/MediaPlayer.h>


@interface VDMediaPlayerKit : NSObject

+ (UISlider *)volumeSlider;

+ (CGFloat)currentVolume;

+ (void)setVolume:(CGFloat)volume;

+ (void)addVolume:(CGFloat)deltaVolume;

@end
