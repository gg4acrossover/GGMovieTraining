//
//  WSObjectBase.h
//  BaseProject
//
//  Created by viethq on 11/16/15.
//  Copyright © 2015 vnext. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSObjectBase : NSObject

+(instancetype)instanceWithClass:(Class)clazz;
-(void)parseResponseData:(NSDictionary*)dict;

@end
