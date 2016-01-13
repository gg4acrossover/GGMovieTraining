//
//  NSObject+Extension.h
//  BaseProject
//
//  Created by ngocnk on 9/24/14.
//  Copyright (c) 2014 VNEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

- (NSObject*)convertDictToObject:(NSDictionary*)objectDict;
- (NSArray *)allPropertyNames;

@end
