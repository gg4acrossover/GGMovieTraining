//
//  BaseProgress.h
//  GGMovie
//
//  Created by viethq on 1/6/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseProgress : NSObject

+ (instancetype)shareInstance;

- (void)showWithTitle:(NSString*)title;

- (void)hide;

@end
