//
//  VDEmptyTableViewCell.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDEmptyTableViewCell.h"

//#import <VDUtil/VDUtil.h>


@interface VDEmptyTableViewCell ()

@end


@implementation VDEmptyTableViewCell

#pragma Overrides
- (void)awakeFromNib {
    // Initialization code
    [self initial];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma Initial
- (void)initial
{
    
}


#pragma IBActions


#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Delegates


#pragma Methods
#pragma Private Class Method
//+ (instancetype)cellInstance
//{
//    static VDEmptyTableViewCell *cell = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        cell = [VDEmptyTableViewCell initFromNib];
//    } );
//    
//    return cell;
//}

#pragma Private Instance Method

#pragma Public Class Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize
{
//    VDEmptyTableViewCell *cell = [self cellInstance];
    
    return estimatedSize;
}

#pragma Public Instance Method

@end
