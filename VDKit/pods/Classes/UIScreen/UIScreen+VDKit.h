//
//  UIScreen+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef VDIsRetina
#define VDIsRetina \
( [UIScreen instancesRespondToSelector: @selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

#ifndef VDIsIphone5
#define VDIsIphone5 \
([UIScreen instancesRespondToSelector: @selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#endif

#ifndef VDScreen
#define VDScreen \
[UIScreen mainScreen]
#endif


@interface UIScreen (VDKit)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
