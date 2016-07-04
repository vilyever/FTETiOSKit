//
//  NSDictionary+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (VDKit)

#pragma Methods
#pragma Public Class Method
+ (NSDictionary *)vd_dictionaryWithDictionary:(NSDictionary *)firstDictionary mergeWithDictionary:(NSDictionary *)secondDictionary;
+ (NSDictionary *)vd_switchKeyObjectWithDictionary:(NSDictionary *)dictionary;

#pragma Public Instance Method
- (NSDictionary *)vd_mergeWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)vd_switchKeyObject;

@end
