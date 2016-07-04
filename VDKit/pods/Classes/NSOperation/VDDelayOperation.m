//
//  VDDelayOperation.m
//  VDKit
//
//  Created by FTET on 15/3/30.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDDelayOperation.h"

//#import <VDUtil/VDUtil.h>
#import "NSObject+VDKit.h"


@interface VDDelayOperation ()

@property (nonatomic, assign) BOOL onMain;

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) NSTimeInterval delayInterval;

@property (nonatomic, copy) void(^delayBlock)(void);

@end


@implementation VDDelayOperation

#pragma Overrides
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initial];
    }
    
    return self;
}

- (void)dealloc
{
    
}

- (void)main
{
    [super main];
    
    
    [NSThread sleepForTimeInterval:self.delayInterval];
    
    if (self.isCancelled)
    {
        return;
    }
    
    if (self.onMain)
    {
//        VDWeakifySelf;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            VDStrongifySelf;
//            [self excute];
//        });
        
        [self performSelectorOnMainThread:@selector(excute) withObject:nil waitUntilDone:YES];
    }
    else
    {
        [self excute];
    }
    
}


#pragma Initial
- (void)initial
{
    
}


#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (void)setDelegate:(id<VDDelayOperationDelegate>)delegate
{
    _delegate = delegate;
}

- (void)setDatasource:(id<VDDelayOperationDatasource>)datasource
{
//    VDAccessorWaitForViewLoaded(datasource, datasource);
//    VDAccessorForbidEqual(_datasource, datasource);
    
    _datasource = datasource;
    
//    [self reloadData];
}


#pragma Delegates


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method
- (void)excute
{
    if (self.target && self.selector)
    {
        [self.target vd_performSelector:self.selector];
    }
    else if (self.delayBlock)
    {
        self.delayBlock();
    }
    else
    {
        NSLog(@"nothing to delay");
    }
}

#pragma Public Class Method

#pragma Public Instance Method
//- (void)reloadData
//{
//    
//}

- (instancetype)initWithTarget:(id)target selector:(SEL)sel delay:(NSTimeInterval)delayInterval onMain:(BOOL)onMain
{
    self = [self init];
    
    self.target = target;
    self.selector = sel;
    self.delayInterval = delayInterval;
    self.onMain = onMain;
    
    return self;
}

- (instancetype)initWithBlock:(void(^)(void))block delay:(NSTimeInterval)delayInterval onMain:(BOOL)onMain
{
    self = [self init];
    
    self.delayBlock = [block copy];
    self.delayInterval = delayInterval;
    self.onMain = onMain;
    
    return self;
}


@end
