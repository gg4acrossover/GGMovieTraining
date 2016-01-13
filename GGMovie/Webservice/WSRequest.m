//
//  WSRequest.m
//  BaseProject
//
//  Created by viethq on 11/16/15.
//  Copyright © 2015 vnext. All rights reserved.
//

#import "WSRequest.h"
#import "WSObjectBase.h"
#import "BConstant.h"
#import "BMacros.h"
#import "BConfig.h"

static CGFloat const kTimeOutDefault = 15.0f; /* time out must be greater than 15 seconds */
static NSString const *kBaseUrlString = bBaseURL; /* change base url default here */

#pragma mark - Func callback
// ----------------------- C FUNC HELPER ---------------------- //
void successCallback(Class clazz, id responseObject, void(^WSResponse)(WSObjectBase * _Nullable response, NSError * _Nullable error))
{
    id objRps = [WSObjectBase instanceWithClass:clazz];
    
    if (objRps)
    {
        [objRps parseResponseData:responseObject];
        WSResponse(objRps,nil);
    }
    else // if objRps is not kind of WSObjectBase
    {
        
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Reponse class is wrong class", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Create complete response object with WSObjectBase", nil)
                                   };
        NSError *pErrorWrongClass = [NSError errorWithDomain:@"Response complete error" code:-57 userInfo:userInfo];
        WSResponse(nil, pErrorWrongClass);
    }
}

void failCallback(NSURLSessionDataTask* task, NSError *error, void(^WSResponse)(WSObjectBase * _Nullable response, NSError * _Nullable error))
{
    NSHTTPURLResponse* r = (NSHTTPURLResponse*)task.response;
    NSLog( @"status code: %li with error %@", (long)r.statusCode, error);
    
    WSResponse(nil, error);
}


// ----------------------- WSRequest ---------------------- //
#pragma mark - WSRequest Class
@interface WSRequest()

@property( nonatomic, strong) AFHTTPSessionManager *mManager;

@end

@implementation WSRequest

#pragma mark - Init
-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        NSURL *pBaseURL = [NSURL URLWithString:[kBaseUrlString copy]];
        
        self.mManager = [[AFHTTPSessionManager alloc] initWithBaseURL:pBaseURL];
        self.mManager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.mManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.mManager.requestSerializer.timeoutInterval = kTimeOutDefault; // defaul time out
    }
    
    return self;
}

#pragma mark - Public method
-(void)     GET:(NSString*)URLString
     parameters:(id)parameters
  responseClass:(Class) clazz
      withToken:(BOOL)isToken
       complete:(WSResponse) wsResponse
{
    // parse url
    DLog(@"call %@%@", self.mManager.baseURL,URLString);

    // add token
    if (isToken)
    {
        [self.mManager.requestSerializer setValue:[NSString stringWithFormat:@"Token token=\"%@\"", self.mStrToken] forHTTPHeaderField:@"Authorization"];
    }
    
    // request
    [self.mManager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successCallback(clazz, responseObject, wsResponse);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failCallback(task, error, wsResponse);
        
    }];
}

-(void)     POST:(NSString * _Nullable)URLString
      parameters:(nullable id)parameters
   responseClass:(nullable Class)clazz
       withToken:(BOOL)isToken
        complete:(nullable WSResponse) wsResponse
{
    // parse url
    DLog(@"call %@%@", self.mManager.baseURL,URLString);
    
    // add token
    if (isToken)
    {
        [self.mManager.requestSerializer setValue:[NSString stringWithFormat:@"Token token=\"%@\"", self.mStrToken] forHTTPHeaderField:@"Authorization"];
    }
        
    // request
    [self.mManager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        successCallback(clazz, responseObject, wsResponse);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failCallback(task, error, wsResponse);
        
    }];
}

-(void)     PUT:(NSString*)URLString
     parameters:(id)parameters
  responseClass:(Class)clazz
      withToken:(BOOL)isToken
       complete:(WSResponse) wsResponse
{
    // parse url
    DLog(@"call %@%@", self.mManager.baseURL,URLString);
    
    // add token
    if (isToken)
    {
        [self.mManager.requestSerializer setValue:[NSString stringWithFormat:@"Token token=\"%@\"", self.mStrToken] forHTTPHeaderField:@"Authorization"];
    }
    
    // request
    [self.mManager PUT:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        successCallback(clazz, responseObject, wsResponse);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failCallback(task, error, wsResponse);
        
    }];
}

-(void)     DELETE:(NSString *)URLString
        parameters:(id)parameters
     responseClass:(Class)clazz
         withToken:(BOOL)isToken
          complete:(WSResponse)wsResponse
{
    // parse url
    DLog(@"call %@%@", self.mManager.baseURL,URLString);
    
    // add token
    if (isToken)
    {
        [self.mManager.requestSerializer setValue:[NSString stringWithFormat:@"Token token=\"%@\"", self.mStrToken] forHTTPHeaderField:@"Authorization"];
    }

    // request
    [self.mManager DELETE:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        successCallback(clazz, responseObject, wsResponse);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        failCallback(task, error, wsResponse);
        
    }];
}

@end


