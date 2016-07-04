//
//  NSString+VDMD5.m
//  VDKit
//
//  Created by FTET on 15/5/19.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSString+VDMD5.h"

#import <CommonCrypto/CommonDigest.h>

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


@implementation NSString (VDMD5)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method

#pragma Public Instance Method
- (NSString *)vd_md5String {
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

@end
