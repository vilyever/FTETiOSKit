//
//  VDEmptyTableViewCell.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@class VDEmptyTableViewCell;


@protocol VDEmptyTableViewCellDelegate <NSObject>

@required

@optional

@end


@interface VDEmptyTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VDEmptyTableViewCellDelegate> delegate;


#pragma Methods
#pragma Public Class Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize;

#pragma Public Instance Method

@end
