//
//  VDMediaPlayerKit.m
//  VDKit
//
//  Created by FTET on 15/3/11.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDMediaPlayerKit.h"

@implementation VDMediaPlayerKit

+ (UISlider *)volumeSlider
{
    static UISlider *_volumeSlider = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MPVolumeView *volumeView = [[MPVolumeView alloc] init];
        
        for (UIView *view in volumeView.subviews)
        {
            if ([view isKindOfClass:[UISlider class] ])
            {
                _volumeSlider = (UISlider *)view;
                break;
            }
        }
    } );
    
    return _volumeSlider;
}

+ (CGFloat)currentVolume
{
    return [self volumeSlider].value;
}

+ (void)setVolume:(CGFloat)volume
{
    [[self volumeSlider] setValue:volume animated:YES];
    [[self volumeSlider] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

+ (void)addVolume:(CGFloat)deltaVolume
{
    [self setVolume:[self currentVolume] + deltaVolume];
}

@end
