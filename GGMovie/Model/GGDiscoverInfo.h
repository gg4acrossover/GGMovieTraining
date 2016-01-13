//
//  GGDiscoverInfo.h
//  GGMovie
//
//  Created by viethq on 1/6/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "WSObjectBase.h"

@class GGDiscoverModel;

@interface GGDiscoverInfo : WSObjectBase

@property( strong, nonatomic) NSArray<GGDiscoverModel*> *mDatasource;

@end

@interface GGDiscoverModel : JSONModel

@property( assign, nonatomic) BOOL adult;
@property( strong, nonatomic) NSString *backdrop_path;
@property( strong, nonatomic) NSArray<NSNumber*> *genre_ids;
@property( assign, nonatomic) NSUInteger id;
@property( strong, nonatomic) NSString *original_language;
@property( strong, nonatomic) NSString *original_title;
@property( strong, nonatomic) NSString *overview;
@property( strong, nonatomic) NSString *popularity;
@property( strong, nonatomic) NSString *poster_path;
@property( strong, nonatomic) NSString *release_date;
@property( strong, nonatomic) NSString *title;
@property( assign, nonatomic) BOOL video;
@property( assign, nonatomic) CGFloat vote_average;
@property( assign, nonatomic) NSUInteger vote_count;

@end