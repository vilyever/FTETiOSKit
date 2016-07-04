//
//  NSObject+VDKVO.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSObject+VDKVO.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>

#import "NSObject+VDDealloc.h"


static char Blocks_Associated_Object_Key;
static char Targets_KeyPaths_Associated_Object_Key;

@interface VDKVOObject ()

@property (nonatomic, assign) id originObject;
@property (nonatomic, assign) id target;
@property (nonatomic, strong) NSString *keyPath;

@end


@implementation VDKVOObject

#pragma Overrides
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    if (blocksDictionary)
    {
        NSMutableDictionary *subBlocks = [blocksDictionary objectForKey:[NSString stringWithFormat:@"%p%@", object, keyPath] ];
        
        if (subBlocks)
        {
            for (id key in [subBlocks allKeys] )
            {
                void (^block)(NSDictionary *change) = [subBlocks objectForKey:key];
                block(change);
            }
        }
    }
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (instancetype)initWithOriginObject:(id)originObject target:(id)target keyPath:(NSString *)keyPath
{
    VDKVOObject *object = [originObject vd_KVOObject];
    if (!object)
    {
        object = [ [VDKVOObject alloc] init];
        object.originObject = originObject;
        
        [ ( (NSObject *)originObject) setVd_KVOObject:object];
    }
    
    object.target = target;
    object.keyPath = keyPath;
    
    return object;
}

#pragma Public Instance Method
- (void)nextAction:(void (^)(NSDictionary *))block
{
    [self nextActionWithTag:nil action:block];
}

- (void)nextActionWithTag:(NSString *)tag action:(void (^)(NSDictionary *))block
{
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    if (!blocksDictionary)
    {
        blocksDictionary = [ [NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &Blocks_Associated_Object_Key, blocksDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSMutableDictionary *targetsKeyPathsDictionary = objc_getAssociatedObject(self, &Targets_KeyPaths_Associated_Object_Key);
    if (!targetsKeyPathsDictionary)
    {
        targetsKeyPathsDictionary = [ [NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &Targets_KeyPaths_Associated_Object_Key, targetsKeyPathsDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSMutableDictionary *subBlocks = [blocksDictionary objectForKey:[NSString stringWithFormat:@"%p%@", self.target, self.keyPath] ];
    
    if (!subBlocks)
    {
        subBlocks = [ [NSMutableDictionary alloc] init];
        [blocksDictionary setObject:subBlocks forKey:[NSString stringWithFormat:@"%p%@", self.target, self.keyPath] ];
    }
    
    if (tag)
    {
        if (block)
        {
            [subBlocks setObject:block forKey:tag];
        }
        else
        {
            [subBlocks removeObjectForKey:tag];
        }
    }
    else
    {
        for (NSUInteger i = [subBlocks allKeys].count; ; i++)
        {
            tag = [NSString stringWithFormat:@"%lu", (unsigned long)i];
            if (![subBlocks objectForKey:tag] )
            {
                break;
            }
        }
        
        if (block)
        {
            [subBlocks setObject:[block copy] forKey:tag];
        }
    }
    
    NSMutableArray *keyPaths = [targetsKeyPathsDictionary objectForKey:[NSString stringWithFormat:@"%p", self.target] ];
    if (!keyPaths)
    {
        keyPaths = [ [NSMutableArray alloc] init];
        [targetsKeyPathsDictionary setObject:keyPaths forKey:[NSString stringWithFormat:@"%p", self.target] ];
    }
    
    if (![keyPaths containsObject:self.keyPath] )
    {
        [keyPaths addObject:self.keyPath];
        
        [VDDealloc(self.target) nextActionWithTag:@"nextActionWithTag" action:^(id blockSelf) {
            
            NSMutableDictionary *targetsKeyPathsDictionary = objc_getAssociatedObject(self, &Targets_KeyPaths_Associated_Object_Key);
            if (targetsKeyPathsDictionary)
            {
                NSMutableArray *keyPaths = [targetsKeyPathsDictionary objectForKey:[NSString stringWithFormat:@"%p", blockSelf] ];
                if (keyPaths)
                {
                    for (NSString *keyPath in keyPaths)
                    {
                        [blockSelf removeObserver:blockSelf forKeyPath:keyPath];
                    }
                }
            }
            
        } ];
        
        [self.target addObserver:self forKeyPath:self.keyPath options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:NULL];
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
    
    NSMutableDictionary *subBlocks = [blocksDictionary objectForKey:[NSString stringWithFormat:@"%p%@", self.target, self.keyPath] ];
    if (!subBlocks)
    {
        return;
    }
    
    [subBlocks removeObjectForKey:tag];
}

- (void)clearAllActions
{
    @try {
        [self.target removeObserver:self forKeyPath:self.keyPath];
        
        NSMutableDictionary *targetsKeyPathsDictionary = objc_getAssociatedObject(self, &Targets_KeyPaths_Associated_Object_Key);
        if (targetsKeyPathsDictionary)
        {
            NSMutableArray *keyPaths = [targetsKeyPathsDictionary objectForKey:[NSString stringWithFormat:@"%p", self.target] ];
            if (keyPaths)
            {
                [keyPaths removeObject:self.keyPath];
            }
        }
    }
    @catch (NSException *exception) {
    }
    @finally {
    }
    
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    [blocksDictionary removeObjectForKey:[NSString stringWithFormat:@"%p%@", self.target, self.keyPath]  ];
}

@end


static char KVO_Object_Associated_Object_Key;

@implementation NSObject (VDKVO)

@dynamic vd_KVOObject;


#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (void)setVd_KVOObject:(VDKVOObject *)vd_KVOObject
{
    objc_setAssociatedObject(self, &KVO_Object_Associated_Object_Key, vd_KVOObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (VDKVOObject *)vd_KVOObject
{
    return objc_getAssociatedObject(self, &KVO_Object_Associated_Object_Key);
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method

@end
