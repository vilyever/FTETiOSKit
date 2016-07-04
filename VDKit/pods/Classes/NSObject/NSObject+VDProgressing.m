//
//  NSObject+VDProgressing.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSObject+VDProgressing.h"

#import <objc/runtime.h>

//#import <VDUtil/VDUtil.h>


static char Progressing_Identifier_Dictionary_Associated_Object_Key;

float const DefaultProgressingInterval = 0.5f;
NSString * const DefaultProgressingIdentifer = @"DefaultProgressingIdentifer";


@implementation NSObject (VDProgressing)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method
+ (instancetype)vd_progressor
{
    static NSObject *progressor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        progressor = [ [NSObject alloc] init];
    });
    
    return progressor;
}

#pragma Private Instance Method
- (NSMutableDictionary *)vd_progressingEventDictionary
{
    NSMutableDictionary *progressingEventDictionary = objc_getAssociatedObject( [ [self class] vd_progressor], &Progressing_Identifier_Dictionary_Associated_Object_Key);
    
    if (!progressingEventDictionary)
    {
        progressingEventDictionary = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject( [ [self class] vd_progressor], &Progressing_Identifier_Dictionary_Associated_Object_Key, progressingEventDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return progressingEventDictionary;
}

#pragma Public Class Method

#pragma Public Instance Method
- (BOOL)vd_checkProgressing
{
    return [self vd_checkProgressingWithIdentifier:DefaultProgressingIdentifer withProgressingInterval:DefaultProgressingInterval];
}

- (BOOL)vd_checkProgressingWithProgressingInterval:(float)interval
{
    return [self vd_checkProgressingWithIdentifier:DefaultProgressingIdentifer withProgressingInterval:interval];
}

- (BOOL)vd_checkProgressingWithIdentifier:(NSString *)identifier
{
    return [self vd_checkProgressingWithIdentifier:identifier withProgressingInterval:DefaultProgressingInterval];
}

- (BOOL)vd_checkProgressingWithIdentifier:(NSString *)identifier withProgressingInterval:(float)interval
{
    if ( [ [self vd_progressingEventDictionary] objectForKey:identifier] )
    {
        return YES;
    }
    else
    {
        [ [self vd_progressingEventDictionary] setObject:[ [NSObject alloc] init] forKey:identifier];
        
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * interval);
        dispatch_after(delay, dispatch_get_main_queue(), ^(void){
            [ [self vd_progressingEventDictionary] removeObjectForKey:identifier];
        } );
        
        return NO;
    }
}

@end
