//
//  UIApplication+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef VDApplication
#define VDApplication \
[UIApplication sharedApplication]
#endif


extern CGFloat const VDStatusBarHeight;


@interface UIApplication (VDKit)

#pragma Methods
#pragma Public Class Method
+ (void)vd_clearNotifications;

+ (UIView *)vd_statusBar;

#pragma Public Instance Method
- (NSMutableDictionary *)vd_globalDictionary;

@end
