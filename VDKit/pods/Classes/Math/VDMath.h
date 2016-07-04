//
//  VDMath.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef VDCGFloatSign
#define VDCGFloatSign(CGfloat) \
(CGfloat < 0.0f ? -1.0f : 1.0f)
#endif

#ifndef VDMatrixVerticalArrangeToHorizonArrange
#define VDMatrixVerticalArrangeToHorizonArrange(num, rowCount, columnCount) \
(num * columnCount - (num / rowCount) * (rowCount * columnCount - 1) )
#endif

#ifndef VDArrayCount
#define VDArrayCount(array, type) (sizeof(array) / sizeof(type))
#endif


@class VDMath;


@protocol VDMathDelegate <NSObject>

@required

@optional

@end


@interface VDMath : NSObject

@property (nonatomic, weak) id<VDMathDelegate> delegate;


#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
