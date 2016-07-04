//
//  UICollectionViewCell+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UICollectionViewCell+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>

#import "NSObject+VDKit.h"
#import "UIView+VDKit.h"


//static char _Associated_Object_Key;


@implementation UICollectionViewCell (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (void)vd_registerNibByCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerNib:[UINib nibWithNibName:[self vd_className] bundle:nil] forCellWithReuseIdentifier:[self vd_className] ];
}

+ (void)vd_registerClassByCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerClass:self forCellWithReuseIdentifier:[self vd_className] ];
}

+ (instancetype)vd_cellInstance
{
    return nil;
}

+ (CGSize)vd_cellSizeWithEstimatedSize:(CGSize)estimatedSize
{
    return CGSizeZero;
}

#pragma Public Instance Method
- (void)vd_setDisplayView:(UIView *)view
{
    [self.contentView vd_removeAllSubviews];
    [self.contentView vd_addSubview:view scaleToFill:YES];
}

@end
