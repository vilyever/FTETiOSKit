//
//  VDTitleContentTableViewCell+Model.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDTitleContentTableViewCell+Model.h"

#import "VDKit.h"


@implementation VDTitleContentTableViewCellModel

#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content
{
    self = [self initWithTitle:title content:content shouldExpandContentLabel:NO];
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content shouldExpandContentLabel:(BOOL)shouldExpandContentLabel
{
    self = [self initWithTitle:title content:content shouldExpandContentLabel:shouldExpandContentLabel orientation:VDTitleContentTableViewCellOrientationHorizontal];
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content shouldExpandContentLabel:(BOOL)shouldExpandContentLabel orientation:(VDTitleContentTableViewCellOrientation)orientation
{
    self = [self init];
    
    self.title = title;
    self.content = content;
    self.shouldExpandContentLabel = shouldExpandContentLabel;
    self.orientation = orientation;
    
    return self;
}

#pragma Public Instance Method

@end


@implementation VDTitleContentTableViewCell (Model)

#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method
- (void)setModel:(VDTitleContentTableViewCellModel *)model
{
    self.titleLabel.text = model.title;
    self.titleLabelWidth.constant = [model.title vd_frameWithFont:self.titleLabel.font withMaxBoundsWidth:HUGE_VALF].size.width;
    self.titleLabelHeight.constant = [model.title vd_frameWithFont:self.titleLabel.font withMaxBoundsWidth:HUGE_VALF].size.height;
    
    switch (model.orientation) {
        case VDTitleContentTableViewCellOrientationHorizontal:
        {
            if (self.verticalConstraints) {
                [self.contentView removeConstraints:self.verticalConstraints];
                self.verticalConstraints = nil;
                
                [self.contentView addConstraints:self.horizontalConstraints];
            }
        }
            break;
        case VDTitleContentTableViewCellOrientationVertical:
        {
            if (!self.verticalConstraints) {

                [self.contentView removeConstraints:self.horizontalConstraints];
                
                NSMutableArray *array = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[contentLabel]" options:0 metrics:nil views:@{@"contentLabel" : self.contentLabel} ] ];
                [array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:VDStringFormat(@"V:|-%@-[contentLabel]", @(self.titleLabelHeight.constant) ) options:0 metrics:nil views:@{@"contentLabel" : self.contentLabel} ] ];
                
                self.verticalConstraints = [NSArray arrayWithArray:array];
                
                [self.contentView addConstraints:self.verticalConstraints];
            }
        }
            break;
            
        default:
            break;
    }
    
    [self setNeedsUpdateConstraints];
    
    if (model.shouldExpandContentLabel)
    {
        self.contentLabel.numberOfLines = 0;
    }
    else
    {
        self.contentLabel.numberOfLines = 1;
    }
    self.contentLabel.text = model.content;
}

@end
