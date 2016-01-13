//
//  BaseNavigationController.h
//  BaseProject
//
//  Created by viethq on 11/18/15.
//  Copyright © 2015 vnext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

+(nonnull instancetype)shareInstance;

// add btn with img
-(void)addLeftImageBtn:(nonnull NSArray<UIImage*>*)imgs
            withTarget:(nonnull NSArray<NSValue*>*)values;

-(void)addRightImageBtn:(nonnull NSArray<UIImage*>*)imgs
            withTarget:(nonnull NSArray<NSValue*>*)values;

// add btn with title
-(void)addLeftTitleBtn:(nonnull NSArray<NSString*>*)strs
            withTarget:(nonnull NSArray<NSValue*>*)values;

-(void)addRightTitleBtn:(nonnull NSArray<NSString*>*)strs
             withTarget:(nonnull NSArray<NSValue*>*)values;

@end
