//
//  NSString+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSString+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>

#import "NSString+VDRegex.h"


NSString * const VDYesLetter = @"YES";
NSString * const VDNoLetter = @"NO";
NSString * const VDTrueLetter = @"TRUE";
NSString * const VDFalseLetter = @"FALSE";

NSString * const VDLineBreakLetter = @"\r\n";


@implementation NSString (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (NSString *)vd_stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss GMT+0800"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

+ (NSString *)vd_stringFromSeconds:(NSInteger)seconds prefix:(NSString *)prefix
{
    NSInteger hours = 0;
    NSInteger minutes = 0;
    
    hours = seconds / 3600;
    minutes = (seconds - hours * 3600) / 60;
    seconds = seconds - hours * 3600 - minutes * 60;
    
    NSString *formatter = hours < 10 ? @"0%d" : @"%d";
    NSString *strHour = [NSString stringWithFormat:formatter, hours];
    
    formatter = minutes < 10 ? @"0%d" : @"%d";
    NSString *strMinute = [NSString stringWithFormat:formatter, minutes];
    
    formatter = seconds < 10 ? @"0%d" : @"%d";
    NSString *strSecond = [NSString stringWithFormat:formatter, seconds];
    
    return [NSString stringWithFormat:@"%@%@:%@:%@", prefix, strHour, strMinute, strSecond];
}

#pragma Public Instance Method
- (BOOL)vd_isEmptyIncludeSpaces
{
    if (self.length == 0)
    {
        return YES;
    }
    
    NSString *regex = @"^\\s*$";
    return [self vd_isRegexMatched:regex];
}

- (NSInteger)vd_integerValueWithDefaultValue:(NSInteger)defaultValue
{
    if ( [self vd_isEmptyIncludeSpaces] )
    {
        return defaultValue;
    }
    
    return [self intValue];
}

- (BOOL)vd_boolValueWithDefaultYesValue:(NSString *)defaultYesValue
{
    if ( [self vd_isEmptyIncludeSpaces] )
    {
        return NO;
    }
    
    return [self caseInsensitiveCompare:defaultYesValue] == NSOrderedSame;
}

- (NSString *)vd_cleanExcessSpace
{
    NSCharacterSet *whiteSpaces = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *noEmptyString = [NSPredicate predicateWithFormat:@"SELF != ''"];
    
    NSArray *parts = [self componentsSeparatedByCharactersInSet:whiteSpaces];
    NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyString];
    return [filteredArray componentsJoinedByString:@" "];
}

- (NSDate *)vd_dateValue
{
    NSDateFormatter *dateFormatter = [ [NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:self];
    
    return destDate;
}

- (CGRect)vd_frameWithFont:(UIFont *)font withMaxBoundsWidth:(float)width
{
    if (!font)
    {
        return CGRectZero;
    }
    NSDictionary *attributes = @{NSFontAttributeName : font};
    CGRect textFrame = [self boundingRectWithSize:CGSizeMake(width, HUGE_VALF) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
    return textFrame;
}

- (CGRect)vd_frameWithFont:(UIFont *)font withMaxBoundsWidth:(float)width withLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    if (!font)
    {
        return CGRectZero;
    }
    NSMutableParagraphStyle *paragraphStyle = [ [NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    NSDictionary *attributes = @{NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName : paragraphStyle};
    CGRect textFrame = [self boundingRectWithSize:CGSizeMake(width, HUGE_VALF) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
    return textFrame;
}

- (UIFont *)vd_fixFontWithFont:(UIFont *)font withMaxBoundsSize:(CGSize)boundsSize
{
    if (!font)
    {
        return nil;
    }
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGRect textFrame = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    if (textFrame.size.width > (boundsSize.width - 1.0f) || textFrame.size.height > boundsSize.height)
    {
        NSDictionary *nextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:(font.pointSize - 0.1f) ] };
        CGRect nextTextFrame = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nextAttributes context:nil];
        
        if (nextTextFrame.size.width > (boundsSize.width - 1.0f) || nextTextFrame.size.height > boundsSize.height)
        {
            return [self vd_fixFontWithFont:[UIFont systemFontOfSize:(font.pointSize - 0.1f) ] withMaxBoundsSize:boundsSize];
        }
        else
        {
            return font;
        }
    }
    else
    {
        NSDictionary *nextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:(font.pointSize + 0.1f) ] };
        CGRect nextTextFrame = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:nextAttributes context:nil];
        
        if (nextTextFrame.size.width <= (boundsSize.width + 1.0f) && nextTextFrame.size.height <= boundsSize.height)
        {
            return [self vd_fixFontWithFont:[UIFont systemFontOfSize:(font.pointSize + 0.1f) ] withMaxBoundsSize:boundsSize];
        }
        else
        {
            return font;
        }
    }
}

@end
