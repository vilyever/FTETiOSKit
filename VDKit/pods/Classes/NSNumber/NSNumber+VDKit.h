//
//  NSNumber+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef VDNumberWithInt
#define VDNumberWithInt(int) \
[NSNumber numberWithInt:int]
#endif

#ifndef VDNumberWithInteger
#define VDNumberWithInteger(integer) \
[NSNumber numberWithInteger:integer]
#endif

#ifndef VDNumberWithUInteger
#define VDNumberWithUInteger(uInteger) \
[NSNumber numberWithUnsignedInteger:uInteger]
#endif

#ifndef VDNumberWithFloat
#define VDNumberWithFloat(float) \
[NSNumber numberWithFloat:float]
#endif

#ifndef VDNumberWithBool
#define VDNumberWithBool(bool) \
[NSNumber numberWithBool:bool]
#endif


@interface NSNumber (VDKit)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
