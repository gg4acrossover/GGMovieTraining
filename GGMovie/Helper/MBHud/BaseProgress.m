//
//  BaseProgress.m
//  GGMovie
//
//  Created by viethq on 1/6/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import "BaseProgress.h"
#import "MBProgressHUD.h"

@interface BaseProgress()

@property( strong, nonatomic) MBProgressHUD *mProgress;

@end

@implementation BaseProgress

+ (instancetype)shareInstance
{
    static BaseProgress *pBaseProgress = nil;
    static dispatch_once_t oneToken;
    
    dispatch_once(&oneToken, ^{
        pBaseProgress = [[BaseProgress alloc] initPrivate];
    });
    
    return pBaseProgress;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"this method isn't allow"
                                   reason:@"use private method"
                                 userInfo:nil];
    
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self)
    {
        UIWindow *pRootWindow = [UIApplication sharedApplication].delegate.window;
        self.mProgress = [[MBProgressHUD alloc] initWithWindow:pRootWindow];
        [pRootWindow addSubview:self.mProgress];
    }
    
    return self;
}

- (void)showWithTitle:(NSString*)title
{
    [self.mProgress hide:YES];
    self.mProgress.labelText = title;
    [self.mProgress show:YES];
}

- (void)hide
{
    [self.mProgress hide:YES];
}

@end
