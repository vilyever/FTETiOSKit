//
//  NSObject+VDNotification.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef VDNotification
#define VDNotification(OBSERVER, NOTIFICATION, OBJECT) \
[VDNotificationObject initWithOriginObject:OBSERVER notification:NOTIFICATION notificationObject:OBJECT]
#endif

#ifndef VDPostNotification
#define VDPostNotification(NOTIFICATION, OBJECT, USERINFO) \
[ [NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION object:OBJECT userInfo:USERINFO]
#endif


NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better")
@interface VDNotificationObject : NSObject

@property (nonatomic, assign) id originObject;
@property (nonatomic, strong) NSString *notification;
@property (nonatomic, assign) id notificationObject;


#pragma Methods
#pragma Public Class Method
+ (instancetype)initWithOriginObject:(id)originObject notification:(NSString *)notification notificationObject:(id)notificationObject;

#pragma Public Instance Method
- (void)nextAction:(void (^)(NSNotification *notification) )block;
- (void)nextActionWithTag:(NSString *)tag action:(void (^)(NSNotification *notification) )block;
- (void)removeActionWithTag:(NSString *)tag;
- (void)clearAllActions;

@end


@interface NSObject (VDNotification)

@property (nonatomic, strong) VDNotificationObject *vd_notificationObject NS_DEPRECATED_IOS(5_0, 5_0, "ReactiveCocoa can do this better");


#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method

@end
