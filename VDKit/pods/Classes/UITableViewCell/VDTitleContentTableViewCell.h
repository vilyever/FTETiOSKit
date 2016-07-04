//
//  VDTitleContentTableViewCell.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@class VDTitleContentTableViewCell;


@protocol VDTitleContentTableViewCellDelegate <NSObject>

@required

@optional

@end


@interface VDTitleContentTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VDTitleContentTableViewCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelWidth;
@property (unsafe_unretained, nonatomic) IBOutlet NSLayoutConstraint *titleLabelHeight;
@property (unsafe_unretained, nonatomic) IBOutlet NSLayoutConstraint *titleLabelBottom;


@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (unsafe_unretained, nonatomic) IBOutlet NSLayoutConstraint *contentLabelTop;
@property (unsafe_unretained, nonatomic) IBOutlet NSLayoutConstraint *contentLabelLeft;

@property (nonatomic, strong) NSArray *horizontalConstraints;
@property (nonatomic, strong) NSArray *verticalConstraints;


#pragma Methods
#pragma Public Class Method
+ (CGSize)cellSizeWithEstimatedSize:(CGSize)estimatedSize;
+ (UIFont *)defaultFont;

#pragma Public Instance Method

@end
