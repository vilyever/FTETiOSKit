//
//  VDLogger.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#ifndef VDKit_VDLogger_h
#define VDKit_VDLogger_h

#ifndef VDLog
#define VDLog(frmt, ...) \
NSLog(@"\nFile: %s\nMethod: %s\nLine: %d\nLog: %@\n   ", __FILE__, __FUNCTION__, __LINE__, [NSString stringWithFormat:frmt, ##__VA_ARGS__] )
#endif

#endif
