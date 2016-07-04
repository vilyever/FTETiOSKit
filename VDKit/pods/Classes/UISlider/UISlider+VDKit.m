//
//  UISlider+VDKit.m
//  VDKit
//
//  Created by FTET on 15/7/30.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UISlider+VDKit.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


@implementation UISlider (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (CGFloat)vd_trackHeight
{
    if ([self isKindOfClass:[VDSlider class]]) {
        return ((VDSlider *)self).trackHeight;
    }
    
    return 0.0f;
}

- (void)setVd_trackHeight:(CGFloat)vd_trackHeight
{
    if ([self isKindOfClass:[VDSlider class]]) {
        ((VDSlider *)self).trackHeight = vd_trackHeight;
    }
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method


#pragma Public Class Method

#pragma Public Instance Method

#pragma load


@end
