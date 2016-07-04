//
//  NSString+VDKeyPath.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef VDKeyPath
//#define VDKeyPath(OBJ, PATH) @\
//(((void)(NO && ((void)OBJ.PATH, NO)), # PATH))

#define VDKeyPath(Target, Path) \
( (void)Target.Path, [NSString vd_keyPathWithTarget:Target keyPath:@(#Path) ] )

#endif


@interface NSString (VDKeyPath)


#pragma Methods
#pragma Public Class Method
+ (instancetype)vd_keyPathWithTarget:(id)target keyPath:(NSString *)keyPath;

#pragma Public Instance Method
- (id)vd_keyPathTarget;

@end
