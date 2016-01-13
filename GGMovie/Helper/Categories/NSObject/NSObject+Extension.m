//
//  NSObject+Extension.m
//  BaseProject
//
//  Created by ngocnk on 9/24/14.
//  Copyright (c) 2014 VNEXT. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

- (NSArray *)allPropertyNames {
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}

- (NSObject*)convertDictToObject:(NSDictionary *)objectDict {
    NSArray *allKeyDict = [objectDict allKeys];
    
    NSUInteger count = [allKeyDict count];
    for (int i = 0; i < count; i++) {
        id obj = [objectDict objectForKey:[allKeyDict objectAtIndex:i]];
        if ([self respondsToSelector:NSSelectorFromString([allKeyDict objectAtIndex:i])]) {
            [self setValue:obj forKey:[allKeyDict objectAtIndex:i]];
        }
    }
    return self;
}

@end
