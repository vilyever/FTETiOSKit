//
//  UILabel+VDVerticalAlignment.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UILabel+VDVerticalAlignment.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Vertical_Alignment_Associated_Object_Key;


@implementation UILabel (VDVerticalAlignment)

@dynamic vd_textVerticalAlignment;

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method
- (CGRect)vd_verticalAlignmentTextRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [self vd_verticalAlignmentTextRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    switch (self.vd_textVerticalAlignment) {
        case VDTextVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VDTextVerticalAlignmentCenter:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0f;
            break;
            
        case VDTextVerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
            
        default:
            break;
    }
    
    return textRect;
}

- (void)vd_verticalAlignmentDrawTextInRect:(CGRect)rect
{
    CGRect textRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [self vd_verticalAlignmentDrawTextInRect:textRect];
}

#pragma Public Class Method

#pragma Public Instance Method
- (VDTextVerticalAlignment)vd_textVerticalAlignment
{
    NSNumber *alignment = objc_getAssociatedObject(self, &Vertical_Alignment_Associated_Object_Key);
    
    if (alignment)
    {
        return [alignment integerValue];
    }
    
    alignment = [NSNumber numberWithInt:VDTextVerticalAlignmentCenter];
    objc_setAssociatedObject(self, &Vertical_Alignment_Associated_Object_Key, alignment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return VDTextVerticalAlignmentCenter;
}

- (void)setVd_textVerticalAlignment:(VDTextVerticalAlignment)vd_textVerticalAlignment
{
    NSNumber *alignment = [NSNumber numberWithInt:vd_textVerticalAlignment];
    objc_setAssociatedObject(self, &Vertical_Alignment_Associated_Object_Key, alignment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setNeedsDisplay];
}


#pragma load
+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(textRectForBounds:limitedToNumberOfLines:) ), class_getInstanceMethod(self, @selector(vd_verticalAlignmentTextRectForBounds:limitedToNumberOfLines:) ) );
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(drawTextInRect:) ), class_getInstanceMethod(self, @selector(vd_verticalAlignmentDrawTextInRect:) ) );
}

@end
