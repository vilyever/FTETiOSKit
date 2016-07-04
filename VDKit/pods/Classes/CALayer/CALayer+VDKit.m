//
//  CALayer+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "CALayer+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


//static char _Associated_Object_Key;


@implementation CALayer (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method
- (void)vd_addShadow
{
    self.shadowColor = [UIColor blackColor].CGColor;
    self.shadowOffset = CGSizeMake(0.0f, 3.0f);
    self.shadowOpacity = 0.6f;
}

- (void)vd_clearShadow
{
    self.shadowColor = [UIColor clearColor].CGColor;
    self.shadowOffset = CGSizeZero;
    self.shadowOpacity = 0.0f;
}

@end
