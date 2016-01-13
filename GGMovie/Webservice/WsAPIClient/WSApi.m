//
//  WSApi.m
//  GGMovie
//
//  Created by viethq on 1/6/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import "WSApi.h"
#import "BConstant.h"
#import "GGDiscoverInfo.h"

static NSString* const kMethodListMovies = @"discover/movie?";
static NSString* const kSortType = @"&sort_by=popularity.desc";

@implementation WSApi

+ (void)getListMoviesWithComplete:(nonnull WSResponse)wsResponse
{
    NSString *pURLString = [NSString stringWithFormat:@"%@api_key=%@%@", kMethodListMovies,
                            API_KEY,kSortType];
    
    [[WSRequest new] GET: pURLString
              parameters: @{@"page" : @1}
           responseClass: [GGDiscoverInfo class]
               withToken: NO
                complete: wsResponse];
}

@end
