//
//  UICollectionView+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UICollectionView+VDKit.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Last_Selected_Row_Index_Path_Associated_Object_Key;


@implementation UICollectionView (VDKit)

@dynamic vd_lastSelectedRowIndexPath;


#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (void)setVd_lastSelectedRowIndexPath:(NSIndexPath *)vd_lastSelectedRowIndexPath
{
    objc_setAssociatedObject(self, &Last_Selected_Row_Index_Path_Associated_Object_Key, vd_lastSelectedRowIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSIndexPath *)vd_lastSelectedRowIndexPath
{
    return objc_getAssociatedObject(self, &Last_Selected_Row_Index_Path_Associated_Object_Key);
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method

@end
