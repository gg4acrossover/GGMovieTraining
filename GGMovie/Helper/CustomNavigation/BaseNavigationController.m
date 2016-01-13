//
//  BaseNavigationController.m
//  BaseProject
//
//  Created by viethq on 11/18/15.
//  Copyright © 2015 vnext. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

#pragma mark - Instance
+(instancetype)shareInstance
{
    static BaseNavigationController *pNav = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pNav = [[BaseNavigationController alloc] init];
    });
    
    return pNav;
}

#pragma mark - View life circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     * set color for left items and right items
     * set color for title view
     */
    // color of item change here
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    
    // color of title view change here
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    // TODO: add icon app here
}

#pragma mark - Private method
-(SEL)selectorForValue:(NSValue*)value
{
    SEL selector = nil;
    selector = [value pointerValue];
    return selector;
}

#pragma mark - Add btn
-(void)addLeftImageBtn:(nonnull NSArray<UIImage*>*)imgs
            withTarget:(nonnull NSArray<NSValue*>*)values
{
    NSMutableArray<UIBarButtonItem*> *pItems = [[NSMutableArray alloc] initWithCapacity:imgs.count];
    NSUInteger idx = 0;
    UIViewController *pVC = self.topViewController;
    
    for (UIImage *pImg in imgs)
    {
        NSValue *pValue = idx < values.count ? (NSValue*)values[idx] : nil;
        if ([pVC respondsToSelector:[self selectorForValue:pValue]])
        {
            UIBarButtonItem *pItem = [[UIBarButtonItem alloc] initWithImage:pImg
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:pVC
                                                                     action:[self selectorForValue:pValue]];
            [pItems addObject:pItem];
        }

        ++idx;
    }
    
    pVC.navigationItem.leftBarButtonItems = nil;
    pVC.navigationItem.leftBarButtonItems = pItems;
}

-(void)addRightImageBtn:(nonnull NSArray<UIImage*>*)imgs
             withTarget:(nonnull NSArray<NSValue*>*)values
{
    NSMutableArray<UIBarButtonItem*> *pItems = [[NSMutableArray alloc] initWithCapacity:imgs.count];
    NSUInteger idx = 0;
    UIViewController *pVC = self.topViewController;
    
    for (UIImage *pImg in imgs)
    {
        NSValue *pValue = idx < values.count ? (NSValue*)values[idx] : nil;
        
        if ([pVC respondsToSelector:[self selectorForValue:pValue]])
        {
            UIBarButtonItem *pItem = [[UIBarButtonItem alloc] initWithImage:pImg
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:pVC
                                                                     action:[self selectorForValue:pValue]];
            [pItems addObject:pItem];
        }
        
        ++idx;
    }
    
    pVC.navigationItem.rightBarButtonItems = nil;
    pVC.navigationItem.rightBarButtonItems = pItems;
}

-(void)addLeftTitleBtn:(nonnull NSArray<NSString*>*)strs
            withTarget:(nonnull NSArray<NSValue*>*)values
{
    NSMutableArray<UIBarButtonItem*> *pItems = [[NSMutableArray alloc] initWithCapacity:strs.count];
    NSUInteger idx = 0;
    UIViewController *pVC = self.topViewController;
    
    for (NSString *pStr in strs)
    {
        NSValue *pValue = idx < values.count ? (NSValue*)values[idx] : nil;
        if ([pVC respondsToSelector:[self selectorForValue:pValue]])
        {
            UIBarButtonItem *pItem = [[UIBarButtonItem alloc] initWithTitle:pStr
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:pVC
                                                                     action:[self selectorForValue:pValue]];
        
            [pItems addObject:pItem];
        }
        
        ++idx;
    }
    
    pVC.navigationItem.leftBarButtonItems = nil;
    pVC.navigationItem.leftBarButtonItems = pItems;
}

-(void)addRightTitleBtn:(nonnull NSArray<NSString*>*)strs
             withTarget:(nonnull NSArray<NSValue*>*)values
{
    NSMutableArray<UIBarButtonItem*> *pItems = [[NSMutableArray alloc] initWithCapacity:strs.count];
    NSUInteger idx = 0;
    UIViewController *pVC = self.topViewController;
    
    for (NSString *pStr in strs)
    {
        NSValue *pValue = idx < values.count ? (NSValue*)values[idx] : nil;
        
        if ([pVC respondsToSelector:[self selectorForValue:pValue]])
        {
            UIBarButtonItem *pItem = [[UIBarButtonItem alloc] initWithTitle:pStr
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:pVC
                                                                     action:[self selectorForValue:pValue]];

            [pItems addObject:pItem];
        }
        
        ++idx;
    }
    
    pVC.navigationItem.rightBarButtonItems = nil;
    pVC.navigationItem.rightBarButtonItems = pItems;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // TODO: add icon app here
    [super pushViewController:viewController animated:animated];
}

@end
