//
//  VDDelayOperation.h
//  VDKit
//
//  Created by FTET on 15/3/30.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


@class VDDelayOperation;


@protocol VDDelayOperationDelegate <NSObject>

@required

@optional

@end


@protocol VDDelayOperationDatasource <NSObject>

@required

@optional

@end


@interface VDDelayOperation : NSOperation

@property (nonatomic, weak) id<VDDelayOperationDelegate> delegate;
@property (nonatomic, weak) id<VDDelayOperationDatasource> datasource;


#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
//- (void)reloadData;
- (instancetype)initWithTarget:(id)target selector:(SEL)sel delay:(NSTimeInterval)delayInterval onMain:(BOOL)onMain;
- (instancetype)initWithBlock:(void(^)(void))block delay:(NSTimeInterval)delayInterval onMain:(BOOL)onMain;

@end
