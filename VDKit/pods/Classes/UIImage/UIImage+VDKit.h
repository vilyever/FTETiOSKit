//
//  UIImage+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef VDLoadImage
#define VDLoadImage(file, type) \
[UIImage imageWithContentsOfFile:[ [NSBundle mainBundle] pathForResource:file ofType:type] ]
#endif


@interface UIImage (VDKit)

#pragma Methods
#pragma Public Class Method
+ (UIImage *)vd_imageWithColor:(UIColor *)color;

+ (UIImage *)vd_imageWithColor:(UIColor *)color withImageSize:(CGSize)size;

+ (UIImage *)vd_imageWithColor:(UIColor *)color withImageSize:(CGSize)size withCornerRadius:(float)cornerRadius;

+ (UIImage *)vd_resizeImage:(UIImage *)image withProportion:(CGFloat)proportion;

+ (UIImage *)vd_imageWithView:(UIView *)view;

#pragma Public Instance Method

@end
