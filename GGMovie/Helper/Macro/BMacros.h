//
//  BMacros.h
//  GGMovie
//
//  Created by viethq on 12/31/15.
//  Copyright © 2015 viethq. All rights reserved.
//

#ifndef BMacros_h
#define BMacros_h

/* ===============================================================
 * GLOBAL MACRO
 * =============================================================== */

//------------------- SHARE INSTANCE -------------------------
#define MAIN_SCREEN [UIScreen mainScreen]
#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]
#define MAIN_BUNDLE [NSBundle mainBundle]
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define MAIN_DELEGATE [[UIApplication sharedApplication] delegate]

//------------------- SCREEN -------------------------
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//------------------- LOG -------------------------
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"[%@] [Line %d] " fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, ##__VA_ARGS__)
#else
#   define DLog(...)
#endif

//------------------- SYSTEM VERSION -------------------------
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//------------------- DEVICE -------------------------
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//------------------- LANGUAGE -------------------------
#define CURRENT_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

//------------------- COLOR -------------------------
#define CLEARCOLOR [UIColor clearColor]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//------------------- STRING -------------------------
#define	NSLS(str)               NSLocalizedString(str, nil)

//------------------- FRAME -------------------------
#define WIDTH(v)                CGRectGetWidth((v).frame)
#define HEIGHT(v)               CGRectGetHeight((v).frame)

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

/* ===============================================================
 * PROJECT MACRO
 * =============================================================== */

//------------------- LOADING -------------------------
#define SHOW_LOADING [[BaseProgress shareInstance] showWithTitle:@"Loading"]
#define HIDE_LOADING [[BaseProgress shareInstance] hide]
#define SHOW_LOADING_TITLE(str) [[BaseProgress shareInstance] showWithTitle:str]

//------------------- NAVIGATION -------------------------
#define MAIN_NAV [BaseNavigationController shareInstance]

#endif /* BMacros_h */
