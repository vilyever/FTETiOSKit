//
//  VDEmptyCollectionViewCell.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@class VDEmptyCollectionViewCell;


@protocol VDEmptyCollectionViewCellDelegate <NSObject>

@required

@optional

@end


@interface VDEmptyCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<VDEmptyCollectionViewCellDelegate> delegate;


#pragma Methods
#pragma Public Class Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize;

#pragma Public Instance Method

@end
