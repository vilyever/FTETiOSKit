//
//  UITableViewCell+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UITableViewCell+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>

#import "NSObject+VDKit.h"
#import "UIView+VDKit.h"


//static char _Associated_Object_Key;


@implementation UITableViewCell (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (void)vd_registerNibByTableView:(UITableView *)tableView
{
    [tableView registerNib:[UINib nibWithNibName:[self vd_className] bundle:nil] forCellReuseIdentifier:[self vd_className] ];
}

+ (void)vd_registerClassByTableView:(UITableView *)tableView
{
    [tableView registerClass:[self class] forCellReuseIdentifier:[self vd_className] ];
}

//+ (instancetype)cellInstance
//{
//    return nil;
//}
//
//+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize
//{
//    return CGSizeZero;
//}

#pragma Public Instance Method
- (void)vd_setDisplayView:(UIView *)view
{
    [self.contentView vd_removeAllSubviews];
    [self.contentView vd_addSubview:view scaleToFill:YES];
}

@end
