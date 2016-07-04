//
//  VDTitleContentTableViewCell.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDTitleContentTableViewCell.h"

//#import <VDUtil/VDUtil.h>

#import "UILabel+VDVerticalAlignment.h"


@interface VDTitleContentTableViewCell ()

@end


@implementation VDTitleContentTableViewCell

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
    self.titleLabel.vd_textVerticalAlignment = VDTextVerticalAlignmentTop;
    self.contentLabel.vd_textVerticalAlignment = VDTextVerticalAlignmentTop;
    
    self.horizontalConstraints = [NSArray arrayWithObjects:self.titleLabelBottom, self.contentLabelLeft, self.contentLabelTop, nil];
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
//    static VDTitleContentTableViewCell *cell = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        cell = [VDTitleContentTableViewCell viewFromNib];
//    } );
//    
//    return cell;
//}

#pragma Private Instance Method

#pragma Public Class Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize
{
//    VDTitleContentTableViewCell *cell = [self cellInstance];
    
    return estimatedSize;
}

+ (UIFont *)defaultFont
{
    return [UIFont systemFontOfSize:17.0f];
}

#pragma Public Instance Method

@end
