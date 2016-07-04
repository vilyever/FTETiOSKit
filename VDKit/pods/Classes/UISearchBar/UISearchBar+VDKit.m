//
//  UISearchBar+VDKit.m
//  VDKit
//
//  Created by FTET on 15/3/23.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UISearchBar+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


//static char _Associated_Object_Key;

NSString * const DefaultCancelButtonTitle = @"Cancel";


@implementation UISearchBar (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method
- (UITextField *)vd_textField
{
    UITextField *textField = nil;
    
    for(int i = 0; i < self.subviews.count; i++)
    {
        if( [self.subviews[i] isKindOfClass:[UITextField class] ] )
        {
            textField = self.subviews[i];
            break;
        }
    }

    
    return textField;
}

- (UIButton *)vd_cancelButton
{
    UIButton *cancelButton = nil;

    for(UIView *subView in self.subviews)
    {
        if( [subView isKindOfClass:[UIButton class] ] )
        {
            cancelButton = (UIButton *)subView;
            break;
        }
        
        for (UIView *view in subView.subviews)
        {
            if( [view isKindOfClass:[UIButton class] ] )
            {
                cancelButton = (UIButton *)view;
                break;
            }
        }
    }
    
    return cancelButton;
}

@end
