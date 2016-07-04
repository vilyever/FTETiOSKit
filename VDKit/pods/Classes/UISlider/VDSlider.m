//
//  VDSlider.m
//  VDKit
//
//  Created by FTET on 15/7/31.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDSlider.h"

//#import <VDUtil/VDUtil.h>


@interface VDSlider ()

@end


@implementation VDSlider

#pragma mark Overrides
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initial];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initial];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initial];
    }
    
    return self;
}

- (void)dealloc
{
    
}

- (CGRect)trackRectForBounds:(CGRect)bounds {
    CGRect trackRect = [super trackRectForBounds:bounds];
    if (self.trackHeight > 0.0f) {
        trackRect.size.height = self.trackHeight;
    }
    return trackRect;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


#pragma mark Initial
- (void)initial
{
    
}


#pragma mark IBActions


#pragma mark Accessors
#pragma mark Private Accessors

#pragma mark Public Accessors
- (void)setTrackHeight:(CGFloat)trackHeight {
    _trackHeight = trackHeight;
    [self setNeedsDisplay];
}


#pragma mark Delegates


#pragma mark Methods
#pragma mark Private Class Method

#pragma mark Private Instance Method

#pragma mark Public Class Method

#pragma mark Public Instance Method
//- (void)reloadData
//{
//
//}

@end
