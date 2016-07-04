//
//  NSString+VDRegex.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


// check ip regex e.g. 192.168.1.1
extern NSString * const VDRegexIP;

// check port regex 0-65535
extern NSString * const VDRegexPort;

// check chinese name regex, 2-15 chinese character
extern NSString * const VDRegexChineseName;

// check chinese cell number and tel number e.g. 83238832 13177881122
extern NSString * const VDRegexPhoneNumberInChina;

// check only has letter number and underscore e.g. hello_1
#define VDRegexNumberLetterUnderscore(MIN_NUM, MAX_NUM) \
[NSString stringWithFormat:@"^\\w{%d,%d}$", MIN_NUM, MAX_NUM]


@interface NSString (VDRegex)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
- (BOOL)vd_isRegexMatched:(NSString *)regex;

@end
