//
//  UIImage+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UIImage+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>

#import <QuartzCore/QuartzCore.h>


//static char _Associated_Object_Key;


@implementation UIImage (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (UIImage *)vd_imageWithColor:(UIColor *)color
{
    return [self vd_imageWithColor:color withImageSize:CGSizeMake(1.0f, 1.0f) ];
}

+ (UIImage *)vd_imageWithColor:(UIColor *)color withImageSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = nil;
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)vd_imageWithColor:(UIColor *)color withImageSize:(CGSize)size withCornerRadius:(float)cornerRadius
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius) ];
    
    [path closePath];
    [path fill];
    
    UIImage *image = nil;
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)vd_resizeImage:(UIImage *)image withProportion:(CGFloat)proportion
{
    if (proportion <= 0.0f)
    {
        return nil;
    }
    
    CGImageRef imageRef = [image CGImage];
    CGFloat imageWidth = CGImageGetWidth(imageRef) * proportion;
    CGFloat imageHeight = CGImageGetHeight(imageRef) * proportion;
    
    CGRect bounds = CGRectMake(0.0f, 0.0f, imageWidth, imageHeight);
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, 0.0f);
    [image drawInRect:bounds];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}

+ (UIImage *)vd_imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext() ];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma Public Instance Method

@end
