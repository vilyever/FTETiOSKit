//
//  NSString+VDJavaScript.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (VDJavaScript)

#pragma Methods
#pragma Public Class Method
+ (NSString *)vd_javaScriptGetHtml;

+ (NSString *)vd_javaScriptTextScale:(float)scale;

/**
 *  resize image size to fit current content
 *
 *  @param maxWidth     max width, the height will be auto resize by
 *  @param functionName a name for call, like xxx() , the brackets is necessary
 *
 *  @return a string use for stringByEvaluatingJavaScriptFromString
 */
+ (NSString *)vd_javaScriptImageMaxWidth:(float)maxWidth functionName:(NSString *)functionName;

+ (NSString *)vd_javaScriptImageRenameWithPrefix:(NSString *)prefix functionName:(NSString *)functionName;

#pragma Public Instance Method
- (NSString *)vd_replaceAllHtmlCharacters;

@end
