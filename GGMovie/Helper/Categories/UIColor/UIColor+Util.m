//
//  UIColor+Util.m
//  GGBaseProject
//
//  Created by viethq on 12/22/15.
//  Copyright © 2015 viethq. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor*)colorWithHexString:(NSString*)hexStr
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed: ((rgbValue & 0xFF0000) >> 16)/255.0f
                           green: ((rgbValue & 0xFF00) >> 8)/255.0f
                            blue: (rgbValue & 0xFF)/255.0f
                           alpha: 1.0f];
}

@end
