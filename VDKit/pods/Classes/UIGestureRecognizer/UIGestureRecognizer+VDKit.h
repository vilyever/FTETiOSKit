//
//  UIGestureRecognizer+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, VDPanGestureDirection) {
    VDPanGestureDirectionUnknown = 0,
    VDPanGestureDirectionLeftward,
    VDPanGestureDirectionUpward,
    VDPanGestureDirectionRightward,
    VDPanGestureDirectionDownward,
    VDPanGestureDirectionHorizontal = 10,
    VDPanGestureDirectionVertical,
};


@interface UIGestureRecognizer (VDKit)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
