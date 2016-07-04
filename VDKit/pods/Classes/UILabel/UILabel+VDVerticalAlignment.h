//
//  UILabel+VDVerticalAlignment.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, VDTextVerticalAlignment) {
    VDTextVerticalAlignmentTop,
    VDTextVerticalAlignmentCenter,
    VDTextVerticalAlignmentBottom
};


@interface UILabel (VDVerticalAlignment)

@property (nonatomic, assign) VDTextVerticalAlignment vd_textVerticalAlignment;

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
