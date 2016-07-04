//
//  VDTitleContentTableViewCell+Model.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDTitleContentTableViewCell.h"


typedef NS_ENUM(NSInteger, VDTitleContentTableViewCellOrientation) {
    VDTitleContentTableViewCellOrientationHorizontal,
    VDTitleContentTableViewCellOrientationVertical,
};


@interface VDTitleContentTableViewCellModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) BOOL shouldExpandContentLabel;
@property (nonatomic, assign) VDTitleContentTableViewCellOrientation orientation;


#pragma Methods
#pragma Public Class Method
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content;
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content shouldExpandContentLabel:(BOOL)shouldExpandContentLabel;
- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content shouldExpandContentLabel:(BOOL)shouldExpandContentLabel orientation:(VDTitleContentTableViewCellOrientation)orientation;

#pragma Public Instance Method

@end


@interface VDTitleContentTableViewCell (Model)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
- (void)setModel:(VDTitleContentTableViewCellModel *)model;

@end
