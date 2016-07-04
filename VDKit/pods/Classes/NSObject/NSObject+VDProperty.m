//
//  NSObject+VDProperty.m
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "NSObject+VDProperty.h"

#import <objc/runtime.h>
#import <objc/message.h>


NSInteger const VDPropertyPrimitiveTypePrimo = VDPropertyPrimitiveTypeUnkown;
NSInteger const VDPropertyPrimitiveTypeFinalis = VDPropertyPrimitiveTypeClass;
NSInteger const VDPropertyPrimitiveTypeFactique = 14;

NSString const * VDPropertyPrimitiveTypeString(VDPropertyPrimitiveType type) {
    switch (type) {
        case VDPropertyPrimitiveTypeUnkown:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeUnkown", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeFloat:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeFloat", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeIntOrSignedOrEnum:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeIntOrSignedOrEnum", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeDouble:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeDouble", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeLong:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeLong", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeCharOrBOOL:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeCharOrBOOL", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeShort:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeShort", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeNSIntegerOrUnsigned:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeNSIntegerOrUnsigned", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeNSUInteger:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeNSUInteger", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeBOOL:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeBOOL", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeBlock:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeBlock", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeVoid:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeVoid", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeId:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeId", @"Vilyever", nil);
            break;
        case VDPropertyPrimitiveTypeClass:
            return NSLocalizedStringFromTable(@"VDPropertyPrimitiveTypeClass", @"Vilyever", nil);
            break;
            
        default:
            return NSLocalizedStringFromTable(@"Unkown", @"Vilyever", nil);
            break;
    }
}


NSString * const PropertyAttributeReadonly = @"R";
NSString * const PropertyAttributeCopy = @"C";
NSString * const PropertyAttributeRetain = @"&";
NSString * const PropertyAttributeNonatomic = @"N";
NSString * const PropertyAttributeDynamic = @"D";
NSString * const PropertyAttributeWeak = @"W";
NSString * const PropertyAttributePointer = @"^";
NSString * const PropertyAttributeGetterPrefix = @"G_";
NSString * const PropertyAttributeSetterPrefix = @"S_";


@interface VDProperty()

@property (nonatomic, assign, readwrite) VDPropertyPrimitiveType primitiveType;

@property (nonatomic, strong, readwrite) NSArray *protocols;

@property (nonatomic, assign, readwrite) BOOL isIgnore;
@property (nonatomic, assign, readwrite) BOOL isNonatomic;
@property (nonatomic, assign, readwrite) BOOL isRetain;
@property (nonatomic, assign, readwrite) BOOL isWeak;
@property (nonatomic, assign, readwrite) BOOL isCopy;
@property (nonatomic, assign, readwrite) BOOL isReadonly;
@property (nonatomic, assign, readwrite) BOOL isDynamic;
@property (nonatomic, assign, readwrite) BOOL isPrimitive;
@property (nonatomic, assign, readwrite) BOOL isMutable;
@property (nonatomic, assign, readwrite) BOOL isStruct;
@property (nonatomic, assign, readwrite) BOOL isPointer;

@property (nonatomic, assign, readwrite) VDPropertyAccessorType getterType;

@property (nonatomic, assign, readwrite) VDPropertyAccessorType setterType;

@end


@implementation VDProperty

#pragma Overrides
- (NSString *)description
{
    NSMutableArray *attributes = [NSMutableArray arrayWithCapacity:13];
    
    if (self.isIgnore) [attributes addObject:@"Ignore"];
    if (self.isNonatomic) [attributes addObject:@"nonatomic"];
    if (self.isRetain) [attributes addObject:@"retain"];
    if (self.isWeak) [attributes addObject:@"weak"];
    if (self.isCopy) [attributes addObject:@"copy"];
    if (self.isReadonly) [attributes addObject:@"readonly"];
    if (self.isDynamic) [attributes addObject:@"dynamic"];
    if (self.isPrimitive) [attributes addObject:@"Primitive"];
    if (self.isMutable) [attributes addObject:@"Mutable"];
    if (self.isStruct) [attributes addObject:@"Struct"];
    if (self.isPointer) [attributes addObject:@"Pointer"];
    if (self.setterSelectorName) [attributes addObject:[NSString stringWithFormat: @"Setter = %@", self.setterSelectorName] ];
    if (self.getterSelectorName) [attributes addObject:[NSString stringWithFormat: @"Getter = %@", self.getterSelectorName] ];
    
    NSString *attributesString = @"";
    if (attributes.count > 0) attributesString = [NSString stringWithFormat:@"(%@)", [attributes componentsJoinedByString:@", "]];
    
    NSString *typeString = [NSString stringWithFormat:@"%@", self.typeName];
    if (self.structName) typeString = [typeString stringByAppendingString:[NSString stringWithFormat:@"(%@)", self.structName] ];
    
    NSString *protocolSting = @"";
    if (self.protocols.count > 0) protocolSting = [NSString stringWithFormat:@"<%@>", [self.protocols componentsJoinedByString:@","]];

    return [NSString stringWithFormat:@"<%@> @property %@ %@%@ %@%@", self.ownerClass, attributesString, typeString, protocolSting, self.isPointer ? @"*" : @"", self.name];
}

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors
- (NSString *)getterSelectorName
{
    if (!_getterSelectorName
        && self.getterType == VDPropertyAccessorTypeOriginal)
    {
        _getterSelectorName = self.name;
    }
    
    return _getterSelectorName;
}

- (NSString *)setterSelectorName
{
    if (!_setterSelectorName
        && self.setterType == VDPropertyAccessorTypeOriginal)
    {
        NSString *firstWord = [self.name substringToIndex:1];
        firstWord = [firstWord uppercaseString];
        _setterSelectorName = [NSString stringWithFormat:@"set%@%@", firstWord, [self.name substringFromIndex:1] ];
    }
    
    return _setterSelectorName;
}


#pragma Methods
#pragma Public Class Method
+ (NSArray *)propertiesWithClass:(Class)objClass
{
    return [self propertiesWithClass:objClass traceToAncestorClass:objClass];
}

+ (NSArray *)propertiesWithClass:(Class)objClass traceToAncestorClass:(__unsafe_unretained Class)ancestorClass
{
    if (!ancestorClass || ![objClass isSubclassOfClass:ancestorClass])
    {
        ancestorClass = objClass;
    }
    
    NSMutableArray *propertyInstances = [ [NSMutableArray alloc] init];
    
    //temp variables for the loops
    Class class = objClass;
    NSScanner *scanner = nil;
    NSString *propertyType = nil;
    
    // inspect inherited properties up to the ancestorClass
    while (class != [ancestorClass superclass] )
    {
        unsigned int propertyCount;
        objc_property_t *properties = class_copyPropertyList(class, &propertyCount);
        NSInteger currentIndex = 0;
        
        //loop over the class properties
        for (unsigned int i = 0; i < propertyCount; i++)
        {
            VDProperty *propertyInstance = [ [VDProperty alloc] init];
            propertyInstance.ownerClass = class;
            
            //get property name
            objc_property_t property = properties[i];
            const char *propertyName = property_getName(property);
            propertyInstance.name = @(propertyName);
            
            //get property attributes
            const char *attrs = property_getAttributes(property);
            NSString *propertyAttributes = @(attrs);
            NSArray *attributeItems = [propertyAttributes componentsSeparatedByString:@","];
            
            if ( [attributeItems containsObject:PropertyAttributeReadonly] ) propertyInstance.isReadonly = YES;
            if ( [attributeItems containsObject:PropertyAttributeCopy] ) propertyInstance.isCopy = YES;
            if ( [attributeItems containsObject:PropertyAttributeRetain] ) propertyInstance.isRetain = YES;
            if ( [attributeItems containsObject:PropertyAttributeNonatomic] ) propertyInstance.isNonatomic = YES;
            if ( [attributeItems containsObject:PropertyAttributeDynamic] ) propertyInstance.isDynamic = YES;
            if ( [attributeItems containsObject:PropertyAttributeWeak] ) propertyInstance.isWeak = YES;

            for (NSString *subAttribute in attributeItems)
            {
                if (subAttribute.length < 2)
                {
                    continue;
                }
                
                if ( [ [subAttribute substringToIndex:2] isEqualToString:PropertyAttributeGetterPrefix] )
                {
                    propertyInstance.getterType = VDPropertyAccessorTypeCustom;
                    propertyInstance.getterSelectorName = [subAttribute substringFromIndex:2];
                }
                else if ( [ [subAttribute substringToIndex:2] isEqualToString:PropertyAttributeSetterPrefix] )
                {
                    propertyInstance.setterType = VDPropertyAccessorTypeCustom;
                    propertyInstance.setterSelectorName = [subAttribute substringFromIndex:2];
                }
            }
            
            scanner = [NSScanner scannerWithString:propertyAttributes];
            
            [scanner scanUpToString:@"T" intoString: nil];
            [scanner scanString:@"T" intoString:nil];
            
            //check if the property is an instance of a class
            if ( [scanner scanString:@"@\"" intoString:&propertyType] )
            {
                
                [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"\"<"]
                                        intoString:&propertyType];
                
                if ( [propertyType isEqualToString:@"@\""] )
                {
                    propertyInstance.isPrimitive = YES;
                    propertyInstance.typeName = @"id";
                }
                else
                {
                    propertyInstance.type = NSClassFromString(propertyType);
                    propertyInstance.typeName = propertyType;
                    propertyInstance.isPointer = YES;
                    propertyInstance.isMutable = ( [propertyType rangeOfString:@"Mutable"].location != NSNotFound);
                }
                
                NSMutableArray *protocols = [ [NSMutableArray alloc] init];
                //read through the property protocols
                while ( [scanner scanString:@"<" intoString:NULL] )
                {
                    NSString *protocolName = nil;
                    
                    [scanner scanUpToString:@">" intoString: &protocolName];
                    
                    [protocols addObject:protocolName];
                    
                    if ( [protocolName isEqualToString:@"VDPropertyIgnore"] )
                    {
                        propertyInstance.isIgnore = YES;
                    }
                    
                    [scanner scanString:@">" intoString:NULL];
                }
                
                propertyInstance.protocols = [NSArray arrayWithArray:protocols];
                
            }
            else if ( [scanner scanString:@"{" intoString: &propertyType])
            {
                //check if the property is a structure
                [scanner scanCharactersFromSet:[NSCharacterSet alphanumericCharacterSet]
                                    intoString:&propertyType];
                
                if ( [propertyType isEqualToString:@"{"] )
                {
                    propertyType = @"?";
                }
                
                propertyInstance.isStruct = YES;
                propertyInstance.structName = propertyType;
                propertyInstance.typeName = @"struct";
            }
            else
            {
                //the property must be a primitive
                NSDictionary *propertyAttributePrimitives = @{@"f":@"float", @"i":@"int/signed/enum", @"d":@"double", @"l":@"long", @"c":@"char/BOOL", @"s":@"short", @"q":@"long", @"I":@"NSInteger/unsigned", @"Q":@"NSUInteger", @"B":@"BOOL", @"@?":@"Block", @"?":@"Block", @"v":@"void", @"@":@"id", @"#":@"Class"};
                
                NSDictionary *propertyTypeAttributePrimitives = @{@"f":@(VDPropertyPrimitiveTypeFloat), @"i":@(VDPropertyPrimitiveTypeIntOrSignedOrEnum), @"d":@(VDPropertyPrimitiveTypeDouble), @"l":@(VDPropertyPrimitiveTypeLong), @"c":@(VDPropertyPrimitiveTypeCharOrBOOL), @"s":@(VDPropertyPrimitiveTypeShort), @"q":@(VDPropertyPrimitiveTypeLong), @"I":@(VDPropertyPrimitiveTypeNSIntegerOrUnsigned), @"Q":@(VDPropertyPrimitiveTypeNSUInteger), @"B":@(VDPropertyPrimitiveTypeBOOL), @"@?":@(VDPropertyPrimitiveTypeBlock), @"?":@(VDPropertyPrimitiveTypeBlock), @"v":@(VDPropertyPrimitiveTypeVoid), @"@":@(VDPropertyPrimitiveTypeId), @"#":@(VDPropertyPrimitiveTypeClass)};
                
                //the property contains a primitive data type
                [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@","]
                                        intoString:&propertyType];
                
                if ( [propertyType containsString:PropertyAttributePointer] )
                {
                    propertyInstance.isPointer = YES;
                    propertyType = [propertyType stringByReplacingOccurrencesOfString:PropertyAttributePointer withString:@""];
                }
                
                //get the full name of the primitive type
                propertyInstance.isPrimitive = YES;
                propertyInstance.typeName = propertyAttributePrimitives[propertyType];
                propertyInstance.primitiveType = [propertyTypeAttributePrimitives[propertyType] integerValue];
            }
            
            [propertyInstances insertObject:propertyInstance atIndex:currentIndex];
            currentIndex++;
        }
        
        free(properties);
        
        //ascend to the super of the class
        class = [class superclass];
    }
    
    return [NSArray arrayWithArray:propertyInstances];
}

#pragma Public Instance Method

@end


@implementation NSObject (VDProperty)

#pragma Accessors
#pragma Private Accessors

#pragma Public Accessors


#pragma Methods
#pragma Private Class Method

#pragma Private Instance Method

#pragma Public Class Method
+ (NSArray *)vd_properties
{
    return [VDProperty propertiesWithClass:self];
}

+ (NSArray *)vd_propertiesTraceToAncestorClass:(Class)ancestorClass
{
    return [VDProperty propertiesWithClass:self traceToAncestorClass:ancestorClass];
}

+ (VDProperty *)vd_propertyWithName:(NSString *)propertyName
{
    for (VDProperty *property in [self vd_properties] )
    {
        if ( [property.name isEqualToString:propertyName] )
        {
            return property;
        }
    }
    
    return nil;
}

#pragma Public Instance Method

@end
