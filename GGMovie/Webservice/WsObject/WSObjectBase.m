//
//  WSObjectBase.m
//  BaseProject
//
//  Created by viethq on 11/16/15.
//  Copyright © 2015 vnext. All rights reserved.
//

#import "WSObjectBase.h"

@implementation WSObjectBase

+(instancetype)instanceWithClass:(Class)clazz
{
    if (![clazz isSubclassOfClass:[WSObjectBase class]])
    {
        return nil;
    }
    
    return [clazz new];
}

-(void)parseResponseData:(NSDictionary *)dict
{
    id tmp = dict;
    NSLog(@"%@", tmp);
}

@end
