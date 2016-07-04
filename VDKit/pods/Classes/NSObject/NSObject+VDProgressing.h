//
//  NSObject+VDProgressing.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef VDCheckProgressing
#define VDCheckProgressing \
if ( [self vd_checkProgressing] )\
{\
    return;\
}
#endif


@interface NSObject (VDProgressing)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
- (BOOL)vd_checkProgressing;
- (BOOL)vd_checkProgressingWithProgressingInterval:(float)interval;
- (BOOL)vd_checkProgressingWithIdentifier:(NSString *)identifier;
- (BOOL)vd_checkProgressingWithIdentifier:(NSString *)identifier withProgressingInterval:(float)interval;

@end
