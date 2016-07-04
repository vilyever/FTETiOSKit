//
//  UIScrollView+VDKit.h
//  VDKit
//
//  Created by FTET on 15/3/27.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIScrollView (VDKit)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
- (BOOL)vd_isReachTop;
- (BOOL)vd_isReachBottom;
- (void)vd_scrollToBottom:(BOOL)animated;

@end
