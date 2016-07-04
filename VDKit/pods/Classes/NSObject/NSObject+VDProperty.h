//
//  NSObject+VDProperty.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, VDPropertyAccessorType) {
    VDPropertyAccessorTypeOriginal,
    VDPropertyAccessorTypeCustom
};

typedef NS_ENUM(NSInteger, VDPropertyPrimitiveType) {
    VDPropertyPrimitiveTypeUnkown,
    VDPropertyPrimitiveTypeFloat,
    VDPropertyPrimitiveTypeDouble,
    VDPropertyPrimitiveTypeIntOrSignedOrEnum,
    VDPropertyPrimitiveTypeShort,
    VDPropertyPrimitiveTypeLong,
    VDPropertyPrimitiveTypeNSIntegerOrUnsigned,
    VDPropertyPrimitiveTypeNSUInteger,
    VDPropertyPrimitiveTypeBOOL,
    VDPropertyPrimitiveTypeCharOrBOOL,
    VDPropertyPrimitiveTypeBlock,
    VDPropertyPrimitiveTypeVoid,
    VDPropertyPrimitiveTypeId,
    VDPropertyPrimitiveTypeClass,
};
extern NSInteger const VDPropertyPrimitiveTypePrimo;
extern NSInteger const VDPropertyPrimitiveTypeFinalis;
extern NSInteger const VDPropertyPrimitiveTypeFactique;
extern NSString const * VDPropertyPrimitiveTypeString(VDPropertyPrimitiveType type);


@protocol VDPropertyIgnore
@end


@interface VDProperty : NSObject

/** Name of the declared property */
@property (nonatomic, copy) NSString *name;

/** Property class type  */
@property (nonatomic, copy) Class type;
@property (nonatomic, copy) NSString *typeName;
@property (nonatomic, assign, readonly) VDPropertyPrimitiveType primitiveType;

/** Property' Owner class type  */
@property (nonatomic, copy) Class ownerClass;

/** Struct name if property is a struct */
@property (nonatomic, copy) NSString *structName;

/** Names of protocols that property conforms */
@property (nonatomic, strong, readonly) NSArray *protocols;

@property (nonatomic, assign, readonly) BOOL isIgnore;
@property (nonatomic, assign, readonly) BOOL isNonatomic;
@property (nonatomic, assign, readonly) BOOL isRetain;
@property (nonatomic, assign, readonly) BOOL isWeak;
@property (nonatomic, assign, readonly) BOOL isCopy;
@property (nonatomic, assign, readonly) BOOL isReadonly;
@property (nonatomic, assign, readonly) BOOL isDynamic;
@property (nonatomic, assign, readonly) BOOL isPrimitive;
@property (nonatomic, assign, readonly) BOOL isMutable;
@property (nonatomic, assign, readonly) BOOL isStruct;
@property (nonatomic, assign, readonly) BOOL isPointer;

/** AccessorType of property getter introspection */
@property (nonatomic, assign, readonly) VDPropertyAccessorType getterType;

/** a custom getter for this property */
@property (nonatomic, copy) NSString *getterSelectorName;

/** AccessorType of property setter introspection */
@property (nonatomic, assign, readonly) VDPropertyAccessorType setterType;

/** a custom setter for this property */
@property (nonatomic, copy) NSString *setterSelectorName;

#pragma Methods
#pragma Public Class Method
+ (NSArray *)propertiesWithClass:(Class)objClass;
+ (NSArray *)propertiesWithClass:(Class)objClass traceToAncestorClass:(Class)ancestorClass;

#pragma Public Instance Method

@end


@interface NSObject (VDProperty)

#pragma Methods
#pragma Public Class Method
+ (NSArray *)vd_properties;
+ (NSArray *)vd_propertiesTraceToAncestorClass:(Class)ancestorClass;
+ (VDProperty *)vd_propertyWithName:(NSString *)propertyName;

#pragma Public Instance Method

@end
