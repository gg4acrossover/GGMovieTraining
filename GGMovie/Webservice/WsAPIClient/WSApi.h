//
//  WSApi.h
//  GGMovie
//
//  Created by viethq on 1/6/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSRequest.h"

@interface WSApi : NSObject

+ (void)getListMoviesWithComplete:(nonnull WSResponse)wsResponse;

@end
