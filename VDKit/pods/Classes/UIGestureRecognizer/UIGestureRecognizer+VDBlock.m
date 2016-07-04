//
//  UIGestureRecognizer+VDBlock.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UIGestureRecognizer+VDBlock.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Blocks_Associated_Object_Key;


@implementation UIGestureRecognizer (VDBlock)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method
- (instancetype)initWithBlockActionWithTag:(NSString *)tag blockAction:(void (^)(UIGestureRecognizer *))block  NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better")
{
    self = [self initWithTarget:self action:@selector(handleGestureWithBlockActions:)];
    
    [self vd_addBlockActionWithTag:tag blockAction:block];
    
    return self;
}

- (void)handleGestureWithBlockActions:(UIGestureRecognizer *)gestureRecognizer
{
    NSMutableDictionary *blocks = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    if (blocks)
    {
        for (id key in [blocks allKeys] )
        {
            void (^block)(UIGestureRecognizer *gestureRecognizer) = [blocks objectForKey:key];
            block(gestureRecognizer);
        }
    }
}

#pragma Public Class Method

#pragma Public Instance Method
- (instancetype)vd_initWithBlockAction:(void (^)(UIGestureRecognizer *))block
{
    return [self initWithBlockActionWithTag:nil blockAction:block];
}

- (instancetype)vd_initWithBlockActionWithTag:(NSString *)tag blockAction:(void (^)(UIGestureRecognizer *))block
{
    return [self initWithBlockActionWithTag:tag blockAction:block];
}

- (void)vd_addBlockAction:(void (^)(UIGestureRecognizer *))block
{
    [self vd_addBlockActionWithTag:nil blockAction:block];
}

- (void)vd_addBlockActionWithTag:(NSString *)tag blockAction:(void (^)(UIGestureRecognizer *))block
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

- (void)vd_removeBlockActionWithTag:(NSString *)tag
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

- (void)vd_clearAllActions
{
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    [blocksDictionary removeAllObjects];
}

@end
