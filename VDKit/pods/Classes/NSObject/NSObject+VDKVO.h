//
//  NSObject+VDKVO.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+VDKeyPath.h"


#ifndef VDObserve
#define VDObserve(TARGET, KEYPATH) \
[VDKVOObject initWithOriginObject:self target:TARGET keyPath:VDKeyPath(TARGET, KEYPATH) ]
#endif

#ifndef VDObserves
#define VDObserves(TARGET, KEYPATH, OBSERVER) \
[VDKVOObject initWithOriginObject:OBSERVER target:TARGET keyPath:VDKeyPath(TARGET, KEYPATH) ]
#endif


NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better")
@interface VDKVOObject : NSObject

#pragma Methods
#pragma Public Class Method
+ (instancetype)initWithOriginObject:(id)originObject target:(id)target keyPath:(NSString *)keyPath;

#pragma Public Instance Method
- (void)nextAction:(void (^)(NSDictionary *change) )block;
- (void)nextActionWithTag:(NSString *)tag action:(void (^)(NSDictionary *change) )block;
- (void)removeActionWithTag:(NSString *)tag;
- (void)clearAllActions;

@end


@interface NSObject (VDKVO)

@property (nonatomic, strong) VDKVOObject *vd_KVOObject NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");


#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
