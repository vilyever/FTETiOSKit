//
//  NSString+VDKeyPath.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSString+VDKeyPath.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Target_Associated_Object_Key;


@implementation NSString (VDKeyPath)


#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (void)setTarget:(id)target
{
    objc_setAssociatedObject(self, &Target_Associated_Object_Key, target, OBJC_ASSOCIATION_ASSIGN);
}

- (id)target
{
    return objc_getAssociatedObject(self, &Target_Associated_Object_Key);
}


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (instancetype)vd_keyPathWithTarget:(id)target keyPath:(NSString *)keyPath
{
    keyPath.target = target;
    
    return keyPath;
}

#pragma Public Instance Method
- (id)vd_keyPathTarget
{
    return self.target;
}

@end
