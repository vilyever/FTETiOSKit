//
//  NSDictionary+VDKit.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSDictionary+VDKit.h"

//#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


//static char _Associated_Object_Key;


@implementation NSDictionary (VDKit)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (NSDictionary *)vd_dictionaryWithDictionary:(NSDictionary *)firstDictionary mergeWithDictionary:(NSDictionary *)secondDictionary
{
    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionaryWithDictionary:firstDictionary];
    
    [secondDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![firstDictionary objectForKey:key] )
        {
            [resultDictionary setObject:obj forKey:key];
        }
    } ];
    
    return [NSDictionary dictionaryWithDictionary:resultDictionary];
}

+ (NSDictionary *)vd_switchKeyObjectWithDictionary:(NSDictionary *)dictionary
{
    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionaryWithCapacity:dictionary.count];
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [resultDictionary setObject:key forKey:obj];
    } ];
    
    return [NSDictionary dictionaryWithDictionary:resultDictionary];
}

#pragma Public Instance Method
- (NSDictionary *)vd_mergeWithDictionary:(NSDictionary *)dictionary
{
    return [self.class vd_dictionaryWithDictionary:self mergeWithDictionary:dictionary];
}

- (NSDictionary *)vd_switchKeyObject
{
    return [self.class vd_switchKeyObjectWithDictionary:self];
}

@end
