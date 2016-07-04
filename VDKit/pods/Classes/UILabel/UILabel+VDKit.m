//
//  UILabel+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UILabel+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


//static char _Associated_Object_Key;


@implementation UILabel (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (UILabel *)vd_copyWithLabel:(UILabel *)originalLabel
{
    UILabel *copiedLabel = [ [UILabel alloc] init];
    
    copiedLabel.frame = originalLabel.frame;
    copiedLabel.text = [originalLabel.text copy];
    copiedLabel.font = originalLabel.font;
    copiedLabel.textColor = originalLabel.textColor;
    copiedLabel.shadowColor = originalLabel.shadowColor;
    copiedLabel.shadowOffset = originalLabel.shadowOffset;
    copiedLabel.textAlignment = originalLabel.textAlignment;
    copiedLabel.lineBreakMode = originalLabel.lineBreakMode;
    copiedLabel.attributedText = [originalLabel.attributedText copy];
    copiedLabel.highlightedTextColor = originalLabel.highlightedTextColor;
    copiedLabel.highlighted = originalLabel.highlighted;
    copiedLabel.userInteractionEnabled = originalLabel.userInteractionEnabled;
    copiedLabel.enabled = originalLabel.enabled;
    copiedLabel.numberOfLines = originalLabel.numberOfLines;
    copiedLabel.adjustsFontSizeToFitWidth = originalLabel.adjustsFontSizeToFitWidth;
    copiedLabel.baselineAdjustment = originalLabel.baselineAdjustment;
    copiedLabel.minimumScaleFactor = originalLabel.minimumScaleFactor;
    
    return copiedLabel;
}

#pragma Public Instance Method

@end
