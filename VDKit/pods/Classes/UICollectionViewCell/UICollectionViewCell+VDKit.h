//
//  UICollectionViewCell+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICollectionViewCell (VDKit)

#pragma Methods
#pragma Public Class Method
+ (void)vd_registerNibByCollectionView:(UICollectionView *)collectionView;

+ (void)vd_registerClassByCollectionView:(UICollectionView *)collectionView;

//+ (instancetype)cellInstance;
//+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize;

#pragma Public Instance Method
- (void)vd_setDisplayView:(UIView *)view;

@end
