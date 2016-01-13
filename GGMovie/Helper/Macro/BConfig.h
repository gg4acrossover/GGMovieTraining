//
//  BConfig.h
//  BaseProject
//
//  Created by ngocnk on 8/4/15.
//  Copyright (c) 2015 vnext. All rights reserved.
//

#ifndef BaseProject_BConfig_h
#define BaseProject_BConfig_h

#define PRODUCTION_ENVIRONMENT false

#if PRODUCTION_ENVIRONMENT
#define bBaseURL @"http://api.themoviedb.org/3/"     // REAL Server
#else
#define bBaseURL @"http://api.themoviedb.org/3/"     // TEST Server
#endif

#endif
