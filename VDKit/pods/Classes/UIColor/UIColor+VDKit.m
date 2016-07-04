//
//  UIColor+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UIColor+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


//static char _Associated_Object_Key;


@implementation UIColor (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (UIColor *)vd_hexColor:(NSString *)hexString
{
    unsigned red = 0;
    unsigned green = 0;
    unsigned blue = 0;
    
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(1, 2) ] ] ] scanHexInt:&red];
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(3, 2) ] ] ] scanHexInt:&green];
    [ [NSScanner scannerWithString:[NSString stringWithFormat:@"0x%@", [hexString substringWithRange:NSMakeRange(5, 2) ] ] ] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)red / 255.0 green:(float)green / 255.0 blue:(float)blue / 255.0 alpha:1.0f];
}

#pragma Public Instance Method

@end
