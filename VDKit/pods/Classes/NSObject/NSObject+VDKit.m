//
//  NSObject+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSObject+VDKit.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Data_Associated_Object_Key;


@implementation NSObject (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (void)setVd_data:(id)vd_data
{
    objc_setAssociatedObject(self, &Data_Associated_Object_Key, vd_data, OBJC_ASSOCIATION_ASSIGN);
}

- (id)vd_data
{
    return objc_getAssociatedObject(self, &Data_Associated_Object_Key);
}

- (void)setVd_identifier:(NSString *)vd_identifier {
    objc_setAssociatedObject(self, @selector(vd_identifier), vd_identifier, OBJC_ASSOCIATION_COPY);
}

- (NSString *)vd_identifier {
    return objc_getAssociatedObject(self, @selector(vd_identifier));
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (NSString *)vd_className
{
    return NSStringFromClass( [self class] );
}

static NSMutableDictionary *VDSharedInstances = nil;
+ (instancetype)vd_sharedInstance {
    return [self vd_sharedInstance:nil];
}

+ (instancetype)vd_sharedInstance:(id (^)(void))initBlock {
    id sharedInstance = nil;
    
    @synchronized(self) {
        NSString *instanceClass = NSStringFromClass(self);
        sharedInstance = [VDSharedInstances objectForKey:instanceClass];
        if (!sharedInstance) {
            if (initBlock) {
                sharedInstance = initBlock();
            } else {
                sharedInstance = [[self alloc] init];
            }
            if (!VDSharedInstances) VDSharedInstances = [NSMutableDictionary dictionary];
            [VDSharedInstances setObject:sharedInstance forKey:instanceClass];
        }
    }
    
    return sharedInstance;
}

+ (void)vd_destroySharedInstance {
    [VDSharedInstances removeObjectForKey:NSStringFromClass(self)];
}


#pragma Public Instance Method
- (void)vd_performActionDelay:(float)secondRatio action:(void (^)(void))block
{
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * secondRatio);
    dispatch_after(delay, dispatch_get_main_queue(), [block copy] );
}

- (void)vd_performSelector:(SEL)aSelector
{
    ( (void (*)(id, SEL) )[self methodForSelector:aSelector] )(self, aSelector);
}

- (void)vd_performSelector:(SEL)aSelector withObject:(id)object
{
    ( (void (*)(id, SEL, id) )[self methodForSelector:aSelector] )(self, aSelector, object);
}

- (void)vd_performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2
{
    ( (void (*)(id, SEL, id, id) )[self methodForSelector:aSelector] )(self, aSelector, object1, object2);
}

- (void)vd_performSelector:(SEL)aSelector withInteger:(NSInteger)integer
{
    ( (void (*)(id, SEL, NSInteger) )[self methodForSelector:aSelector] )(self, aSelector, integer);
}

@end


@implementation VDWeakObjectCarrier

#pragma Methods
#pragma Public Class Method
+ (instancetype)carrierWithWeakObject:(id)object
{
    return [ [VDWeakObjectCarrier alloc] initWithWeakObject:object];
}

#pragma Public Instance Method
- (instancetype)initWithWeakObject:(id)object
{
    self = [super init];
    
    _weakObject = object;
    
    return self;
}

@end
