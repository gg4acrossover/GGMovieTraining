//
//  GGDiscoverInfo.m
//  GGMovie
//
//  Created by viethq on 1/6/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import "GGDiscoverInfo.h"

@implementation GGDiscoverInfo

- (void)parseResponseData:(NSDictionary *)dict
{
    if (![dict isKindOfClass:[NSDictionary class]]) return;
    
    NSArray *pResults = [dict arrayForKey:@"results"];
    
    NSMutableArray<GGDiscoverModel*> *pArrResults = [[NSMutableArray alloc] initWithCapacity:pResults.count];
    for (NSDictionary *pDict in pResults )
    {
        GGDiscoverModel *pModel = [[GGDiscoverModel alloc] initWithDictionary: pDict
                                                                        error: nil];
        [pArrResults addObject:pModel];
    }
    
    self.mDatasource = pArrResults;
}

@end

@implementation GGDiscoverModel

@end
