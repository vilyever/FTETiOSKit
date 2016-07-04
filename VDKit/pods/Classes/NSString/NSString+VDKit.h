//
//  NSString+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


extern NSString * const VDYesLetter;
extern NSString * const VDNoLetter;
extern NSString * const VDTrueLetter;
extern NSString * const VDFalseLetter;

extern NSString * const VDLineBreakLetter;


#ifndef VDString
#define VDString(id) \
( [NSString stringWithFormat:@"%@", id] )
#endif

#ifndef VDStringFormat
#define VDStringFormat(frmt, ...) \
( [NSString stringWithFormat:frmt, ##__VA_ARGS__] )
#endif

#ifndef VDBoolToString
#define VDBoolToString(bool) \
( (bool) ? VDYesLetter : VDNoLetter)
#endif


@interface NSString (VDKit)

#pragma Methods
#pragma Public Class Method
+ (NSString *)vd_stringFromDate:(NSDate *)date;
+ (NSString *)vd_stringFromSeconds:(NSInteger)seconds prefix:(NSString *)prefix;

#pragma Public Instance Method
- (BOOL)vd_isEmptyIncludeSpaces;

- (NSInteger)vd_integerValueWithDefaultValue:(NSInteger)defaultValue;

- (BOOL)vd_boolValueWithDefaultYesValue:(NSString *)defaultYesValue;

- (NSString *)vd_cleanExcessSpace;

- (NSDate *)vd_dateValue;

- (CGRect)vd_frameWithFont:(UIFont *)font withMaxBoundsWidth:(float)width;
- (CGRect)vd_frameWithFont:(UIFont *)font withMaxBoundsWidth:(float)width withLineBreakMode:(NSLineBreakMode)lineBreakMode;

- (UIFont *)vd_fixFontWithFont:(UIFont *)font withMaxBoundsSize:(CGSize)boundsSize;

@end
