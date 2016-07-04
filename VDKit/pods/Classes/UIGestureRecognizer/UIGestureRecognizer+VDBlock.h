//
//  UIGestureRecognizer+VDBlock.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIGestureRecognizer (VDBlock)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
- (instancetype)vd_initWithBlockAction:(void (^)(UIGestureRecognizer *gestureRecognizer) )block NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");
- (instancetype)vd_initWithBlockActionWithTag:(NSString *)tag blockAction:(void (^)(UIGestureRecognizer *gestureRecognizer) )block NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");

- (void)vd_addBlockAction:(void (^)(UIGestureRecognizer *gestureRecognizer) )block NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");
- (void)vd_addBlockActionWithTag:(NSString *)tag blockAction:(void (^)(UIGestureRecognizer *gestureRecognizer) )block NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");
- (void)vd_removeBlockActionWithTag:(NSString *)tag NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");
- (void)vd_clearAllActions NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");

@end
