//
//  UITableViewCell+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITableViewCell (VDKit)

#pragma Methods
#pragma Public Class Method
+ (void)vd_registerNibByTableView:(UITableView *)tableView;

+ (void)vd_registerClassByTableView:(UITableView *)tableView;

//+ (instancetype)cellInstance;
//
//+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize;

#pragma Public Instance Method
- (void)vd_setDisplayView:(UIView *)view;

@end
