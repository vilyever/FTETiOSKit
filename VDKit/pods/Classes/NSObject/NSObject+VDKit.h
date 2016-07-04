//
//  NSObject+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef VDWeakifySelf
#define VDWeakifySelf \
__weak __typeof(&*self)vd_weak_object = self

#define VDStrongifySelf \
__strong __typeof(&*vd_weak_object)self = vd_weak_object
#endif

#define VDIdentifier \
( [NSString stringWithFormat:@"%p_%s_%d", self, __FUNCTION__, __LINE__] )


#define VDAccessorForbidEqual(PropertyValue, AssingingValue) \
if (PropertyValue == AssingingValue)\
{\
return;\
}

#define VDAccessorForbidEqualString(PropertyValue, AssingingValue) \
if ( [PropertyValue isEqualToString:AssingingValue] )\
{\
return;\
}\

#ifndef VDSingletonGCD
#define VDSingletonGCDDeclaration   \
    \
    + (instancetype)sharedInstance;
#define VDSingletonGCD  \
    \
    + (instancetype)sharedInstance    \
    {   \
        static dispatch_once_t pred = 0;    \
        __strong static id _sharedObject = nil; \
        dispatch_once(&pred, ^{ \
            _sharedObject = [[self alloc] init];    \
        }); \
        return _sharedObject;   \
    }

#define VDSingletonGCDWithInitBlock(initBlock)  \
    \
    + (instancetype)sharedInstance    \
    {   \
    static dispatch_once_t pred = 0;    \
    __strong static id _sharedObject = nil; \
    dispatch_once(&pred, ^{ \
    _sharedObject = initBlock();    \
    }); \
    return _sharedObject;   \
    }
#endif


@interface NSObject (VDKit)

@property (nonatomic, weak) id vd_data;
@property (nonatomic, copy) NSString *vd_identifier;


#pragma Methods
#pragma Public Class Method
+ (NSString *)vd_className;

+ (instancetype)vd_sharedInstance;
+ (instancetype)vd_sharedInstance:(id(^)(void))initBlock;
+ (void)vd_destroySharedInstance;

#pragma Public Instance Method
- (void)vd_performActionDelay:(float)secondRatio action:(void (^)(void) )block;
- (void)vd_performSelector:(SEL)aSelector;
- (void)vd_performSelector:(SEL)aSelector withObject:(id)object;
- (void)vd_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
- (void)vd_performSelector:(SEL)aSelector withInteger:(NSInteger)integer;

@end


@interface VDWeakObjectCarrier : NSObject

@property (nonatomic, weak, readonly) id weakObject;

#pragma Methods
#pragma Public Class Method
+ (instancetype)carrierWithWeakObject:(id)object;

#pragma Public Instance Method
- (instancetype)initWithWeakObject:(id)object;

@end
