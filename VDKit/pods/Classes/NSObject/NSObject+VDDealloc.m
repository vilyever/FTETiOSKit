//
//  NSObject+VDDealloc.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSObject+VDDealloc.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Blocks_Associated_Object_Key;


@interface VDDeallocObject()

@property (nonatomic, assign) id target;

@end


@implementation VDDeallocObject

#pragma Overrides
- (void)dealloc
{
    NSMutableDictionary *blocks = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    if (blocks)
    {
        for (id key in [blocks allKeys] )
        {
            void (^block)(id blockSelf) = [blocks objectForKey:key];
            block(self.target);
        }
    }
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method
+ (instancetype)initWithTarget:(id)target
{
    VDDeallocObject *object = [target vd_deallocObject];
    if (!object)
    {
        object = [ [VDDeallocObject alloc] init];
        object.target = target;
        
        [ ( (NSObject *)target) setVd_deallocObject:object];
    }
    
    return object;
}

#pragma Public Instance Method
- (void)nextAction:(void (^)(id))block
{
    [self nextActionWithTag:nil action:block];
}

- (void)nextActionWithTag:(NSString *)tag action:(void (^)(id))block
{
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    if (!blocksDictionary)
    {
        blocksDictionary = [ [NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &Blocks_Associated_Object_Key, blocksDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    if (tag)
    {
        if (block)
        {
            [blocksDictionary setObject:block forKey:tag];
        }
        else
        {
            [blocksDictionary removeObjectForKey:tag];
        }
    }
    else
    {
        for (NSUInteger i = [blocksDictionary allKeys].count; ; i++)
        {
            tag = [NSString stringWithFormat:@"%lu", (unsigned long)i];
            if (![blocksDictionary objectForKey:tag] )
            {
                break;
            }
        }
        
        if (block)
        {
            [blocksDictionary setObject:[block copy] forKey:tag];
        }
    }
}

- (void)removeActionWithTag:(NSString *)tag
{
    if (!tag)
    {
        return;
    }
    
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    if (!blocksDictionary)
    {
        return;
    }
    
    [blocksDictionary removeObjectForKey:tag];
}

- (void)clearAllActions
{
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    [blocksDictionary removeAllObjects];
}

@end


static char Dealloc_Object_Associated_Object_Key;


@implementation NSObject (Dealloc)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (void)setVd_deallocObject:(VDDeallocObject *)vd_deallocObject
{
    objc_setAssociatedObject(self, &Dealloc_Object_Associated_Object_Key, vd_deallocObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (VDDeallocObject *)vd_deallocObject
{
    return objc_getAssociatedObject(self, &Dealloc_Object_Associated_Object_Key);
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method


#pragma load
//+ (void)load
//{
//    SEL originalSelector = NSSelectorFromString(@"dealloc");
//    SEL overrideSelector = @selector(afterDealloc);
//    Method originalMethod = class_getInstanceMethod(self, originalSelector);
//    Method overrideMethod = class_getInstanceMethod(self, overrideSelector);
//
//    if (class_addMethod(self, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod) ) )
//    {
//        class_replaceMethod(self, overrideSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod) );
//    }
//    else
//    {
//        method_exchangeImplementations(originalMethod, overrideMethod);
//    }
//}

@end
