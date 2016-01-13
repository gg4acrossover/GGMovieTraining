//
//  WSRequest.h
//  BaseProject
//
//  Created by viethq on 11/16/15.
//  Copyright © 2015 vnext. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "WSObjectBase.h"

typedef void(^WSResponse)(WSObjectBase * _Nullable response, NSError * _Nullable error);

@interface WSRequest : NSObject

/* property */
@property( strong, nonatomic) NSString * _Nullable mStrToken;

/* API method */
-(void)     GET:(nullable NSString*)URLString
     parameters:(nullable id)parameters
  responseClass:(nullable Class)clazz
      withToken:(BOOL)isToken
       complete:(nullable WSResponse) wsResponse;

-(void)     POST:(nullable NSString*)URLString
      parameters:(nullable id)parameters
   responseClass:(nullable Class)clazz
       withToken:(BOOL)isToken
        complete:(nullable WSResponse) wsResponse;

-(void)      PUT:(nullable NSString*)URLString
      parameters:(nullable id)parameters
   responseClass:(nullable Class)clazz
       withToken:(BOOL)isToken
        complete:(nullable WSResponse) wsResponse;

-(void)   DELETE:(nullable NSString*)URLString
      parameters:(nullable id)parameters
   responseClass:(nullable Class)clazz
       withToken:(BOOL)isToken
        complete:(nullable WSResponse) wsResponse;

@end
