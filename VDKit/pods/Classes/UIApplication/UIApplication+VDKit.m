//
//  UIApplication+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "UIApplication+VDKit.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Global_Dictionary_Associated_Object_Key;


CGFloat const VDStatusBarHeight = 20.0f;


@implementation UIApplication (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (NSMutableDictionary *)globalDictionary
{
    NSMutableDictionary *globalDictionary = objc_getAssociatedObject(self, &Global_Dictionary_Associated_Object_Key);
    
    if (!globalDictionary)
    {
        globalDictionary = [[NSMutableDictionary alloc] init];
        self.globalDictionary = globalDictionary;
    }
    
    return globalDictionary;
}

- (void)setGlobalDictionary:(NSMutableDictionary *)globalDictionary
{
    objc_setAssociatedObject(self, &Global_Dictionary_Associated_Object_Key, globalDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (void)vd_clearNotifications
{
    [VDApplication setApplicationIconBadgeNumber:0];
    [VDApplication cancelAllLocalNotifications];
}

+ (UIView *)vd_statusBar
{
    NSString *key = [ [NSString alloc] initWithData:[NSData dataWithBytes:(unsigned char [] ){0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x42, 0x61, 0x72} length:9] encoding:NSASCIIStringEncoding];
    
    id object = [UIApplication sharedApplication];
    
    UIView *statusBar;
    
    if ([object respondsToSelector:NSSelectorFromString(key) ] )
    {
        statusBar = [object valueForKey:key];
    }
    
    return statusBar;
}

#pragma Public Instance Method
- (NSMutableDictionary *)vd_globalDictionary
{
    return self.globalDictionary;
}

@end
