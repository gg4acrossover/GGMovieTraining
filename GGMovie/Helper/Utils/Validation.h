//
//  Validation.h
//  BaseProject
//
//  Created by ngocnk on 8/5/15.
//  Copyright (c) 2015 VNEXT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject

+ (BOOL)validateStringNotNull:(NSString *)string;

+ (BOOL)validateEmail:(NSString*)email;

+ (BOOL)validatePassword:(NSString*)password isEqualConfirmPassword:(NSString *)confirmPassword;

@end
