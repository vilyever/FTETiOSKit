//
//  UIButton+VDKit.h
//  VDKit
//
//  Created by FTET on 15/2/13.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (VDKit)

/**
 *  By default:
 *  自动转换UIControlStateNormal的\n和\r\n为换行
 *
 *  Known Issue:
 *  若有其它State的Title和UIControlStateNormal相同
 *  无法识别其它State是否设置了title
 *  若其它State设置了和UIControlStateNormal相同的title
 *  无法确定是否要为该State重新设值
 *
 *  Expect value:
 *  UIControlStateHighlighted | UIControlStateSelected | UIControlStateDisabled
 */
@property (nonatomic, assign) UIControlState vd_xibLinesTextState;

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
