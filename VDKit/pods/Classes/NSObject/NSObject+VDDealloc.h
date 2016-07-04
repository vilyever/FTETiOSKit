//
//  NSObject+VDDealloc.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef VDDealloc
#define VDDealloc(Target) \
[VDDeallocObject initWithTarget:Target]
#endif


NS_DEPRECATED_IOS(5_0, 5_0, "Aspects can do this better")
@interface VDDeallocObject : NSObject

#pragma Public Class Method
+ (instancetype)initWithTarget:(id)target;

#pragma Public Instance Method
- (void)nextAction:(void (^)(id blockSelf) )block;
- (void)nextActionWithTag:(NSString *)tag action:(void (^)(id blockSelf) )block;
- (void)removeActionWithTag:(NSString *)tag;
- (void)clearAllActions;

@end


@interface NSObject (VDDealloc)

@property (nonatomic, strong) VDDeallocObject *vd_deallocObject NS_DEPRECATED_IOS(5_0, 5_0, "Aspects can do this better");


#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
