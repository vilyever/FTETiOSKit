//
//  UIScrollView+VDKit.m
//  VDKit
//
//  Created by FTET on 15/3/27.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UIScrollView+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


//static char _Associated_Object_Key;


@implementation UIScrollView (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method
- (BOOL)vd_isReachTop
{
    return self.contentOffset.y <= 0;
}

- (BOOL)vd_isReachBottom
{
    return self.contentOffset.y >= (self.contentSize.height - self.bounds.size.height);
}

- (void)vd_scrollToBottom:(BOOL)animated
{
    if (self.contentSize.height <= self.bounds.size.height)
    {
        return;
    }
    
    [self setContentOffset:CGPointMake(self.contentOffset.x, (self.contentSize.height - self.bounds.size.height)) animated:animated];
}

@end
