//
//  NSObject+VDNotification.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSObject+VDNotification.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Blocks_Associated_Object_Key;


@implementation VDNotificationObject

#pragma Overrides
- (void)dealloc
{
    [ [NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (instancetype)initWithOriginObject:(id)originObject notification:(NSString *)notification notificationObject:(id)notificationObject
{
    VDNotificationObject *object = [originObject notificationObject];
    if (!object)
    {
        object = [ [VDNotificationObject alloc] init];
        object.originObject = originObject;
        
        [ ( (NSObject *)originObject) setVd_notificationObject:object];
    }
    
    object.notification = notification;
    object.notificationObject = notificationObject;
    
    return object;
}

#pragma Private Instance Method
- (void)onReceiveNotification:(NSNotification *)notification
{
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    if (blocksDictionary)
    {
        NSMutableDictionary *blocks = [blocksDictionary objectForKey:[notification name] ];
        
        if (blocks)
        {
            for (id key in [blocks allKeys] )
            {
                void (^block)(NSNotification *notification) = [blocks objectForKey:key];
                block(notification);
            }
        }
    }
}

#pragma Public Instance Method
- (void)nextAction:(void (^)(NSNotification *))block
{
    [self nextActionWithTag:nil action:block];
}

- (void)nextActionWithTag:(NSString *)tag action:(void (^)(NSNotification *))block
{
    [ [NSNotificationCenter defaultCenter] removeObserver:self name:self.notification object:self.notificationObject];
    [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onReceiveNotification:) name:self.notification object:self.notificationObject];
    
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    
    if (!blocksDictionary)
    {
        blocksDictionary = [ [NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &Blocks_Associated_Object_Key, blocksDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    NSMutableDictionary *blocks = [blocksDictionary objectForKey:self.notification];
    
    if (!blocks)
    {
        blocks = [ [NSMutableDictionary alloc] init];
        [blocksDictionary setObject:blocks forKey:self.notification];
    }
    
    if (!tag)
    {
        for (NSUInteger i = [blocks allKeys].count; ; i++)
        {
            tag = [NSString stringWithFormat:@"%lu", (unsigned long)i];
            if (![blocks objectForKey:tag] )
            {
                break;
            }
        }
    }
    
    if (block)
    {
        [blocks setObject:[block copy] forKey:tag];
    }
    else
    {
        [blocks removeObjectForKey:tag];
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
    
    NSMutableDictionary *blocks = [blocksDictionary objectForKey:self.notification];
    if (!blocks)
    {
        return;
    }
    
    [blocks removeObjectForKey:tag];
}

- (void)clearAllActions
{
    [ [NSNotificationCenter defaultCenter] removeObserver:self name:self.notification object:self.notificationObject];
    
    NSMutableDictionary *blocksDictionary = objc_getAssociatedObject(self, &Blocks_Associated_Object_Key);
    [blocksDictionary removeObjectForKey:self.notification];
}

@end


static char Notification_Object_Associated_Object_Key;


@implementation NSObject (VDNotification)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (void)setVd_notificationObject:(VDNotificationObject *)vd_notificationObject
{
    objc_setAssociatedObject(self, &Notification_Object_Associated_Object_Key, vd_notificationObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (VDNotificationObject *)vd_notificationObject
{
    return objc_getAssociatedObject(self, &Notification_Object_Associated_Object_Key);
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method

@end
