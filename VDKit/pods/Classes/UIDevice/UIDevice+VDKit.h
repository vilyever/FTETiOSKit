//
//  UIDevice+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef VDIsIOS7
#define VDIsIOS7 \
( [ [ [UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#endif

#ifndef VDIsIOS8
#define VDIsIOS8 \
( [ [ [UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)
#endif

#ifndef VDIsPad
#define VDIsPad \
(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif


@interface UIDevice (VDKit)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
/*
 * @method uniqueDeviceIdentifier
 * @description use this method when you need a unique identifier in one app.
 * It generates a hash from the MAC-address in combination with the bundle identifier
 * of your app.
 */

- (NSString *)vd_uniqueDeviceIdentifier;

/*
 * @method uniqueGlobalDeviceIdentifier
 * @description use this method when you need a unique global identifier to track a device
 * with multiple apps. as example a advertising network will use this method to track the device
 * from different apps.
 * It generates a hash from the MAC-address only.
 */

- (NSString *)vd_uniqueGlobalDeviceIdentifier;

@end
