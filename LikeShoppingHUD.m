//
//  LikeShoppingHUD.m
//  LikeShopping
//
//  Created by Thunderbird on 7/7/2557 BE.
//  Copyright (c) 2557 E-Commerce Solution Co.,Ltd. All rights reserved.
//

#import "LikeShoppingHUD.h"
#import <QuartzCore/QuartzCore.h>

@interface LikeShoppingHUD ()

- (void)showLoading;
- (void)dismissLoading;

@end

@implementation LikeShoppingHUD

+ (LikeShoppingHUD *)sharedView
{
    static dispatch_once_t once;
    static LikeShoppingHUD *sharedView;
    dispatch_once(&once, ^ {
        sharedView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedView;
}

#pragma mark - show method

+ (void)show
{
    [[self sharedView] showLoading];
}

#pragma mark - dismiss method

+ (void)dismiss
{
    [[self sharedView] dismissLoading];
}

#pragma mark - Private show/dismiss methods

- (void)showLoading
{
    NSArray *loadingImages = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"loading01"],
                             [UIImage imageNamed:@"loading02"],
                             [UIImage imageNamed:@"loading03"],
                             [UIImage imageNamed:@"loading04"],
                             [UIImage imageNamed:@"loading05"],
                             [UIImage imageNamed:@"loading06"],
                             [UIImage imageNamed:@"loading07"],
                             [UIImage imageNamed:@"loading08"],
                             [UIImage imageNamed:@"loading09"],
                             [UIImage imageNamed:@"loading10"],
                             [UIImage imageNamed:@"loading11"],
                             [UIImage imageNamed:@"loading12"],
                             [UIImage imageNamed:@"loading13"],
                             [UIImage imageNamed:@"loading14"],
                             [UIImage imageNamed:@"loading15"],
                             [UIImage imageNamed:@"loading16"],
                             [UIImage imageNamed:@"loading17"],
                             [UIImage imageNamed:@"loading18"],
                             [UIImage imageNamed:@"loading19"],
                             [UIImage imageNamed:@"loading20"],
                             [UIImage imageNamed:@"loading21"],
                             [UIImage imageNamed:@"loading22"],
                             [UIImage imageNamed:@"loading23"],
                             [UIImage imageNamed:@"loading24"],
                             [UIImage imageNamed:@"loading25"],
                             [UIImage imageNamed:@"loading26"],
                             [UIImage imageNamed:@"loading27"],
                             [UIImage imageNamed:@"loading28"],
                             [UIImage imageNamed:@"loading29"],
                             [UIImage imageNamed:@"loading30"],
                             nil];
    
    self.customActivityIndicator = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width)/2 - 65, ([UIScreen mainScreen].bounds.size.height)/2 - 65, 130, 130)];
    [self.customActivityIndicator setAnimationImages:loadingImages];
    [self.customActivityIndicator setAnimationDuration:1.2];
    [self.customActivityIndicator setAnimationRepeatCount:30]; // Max repeat
    [self.customActivityIndicator startAnimating];
    [self.customActivityIndicator setAlpha:0.0];
    
    if(!self.customActivityIndicator.superview){
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication]windows]reverseObjectEnumerator];
        
        for (UIWindow *window in frontToBackWindows)
            if (window.windowLevel == UIWindowLevelNormal) {
                [window addSubview:self.customActivityIndicator];
                [UIView animateWithDuration:0.5
                                 animations:^(void) {
                                     [self.customActivityIndicator setAlpha:1.0];
                                 }];
                break;
            }
    }
    
    // Tap HUD for forge dismiss.
    UITapGestureRecognizer *tapHUD = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissLoading)];
    [tapHUD setNumberOfTapsRequired:1];
    [self.customActivityIndicator addGestureRecognizer:tapHUD];
    [self.customActivityIndicator setUserInteractionEnabled:YES];
    
    [self setNeedsDisplay];
}

- (void)dismissLoading
{
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^(void) {
                         [self.customActivityIndicator setAlpha:0.0];
                     }
                     completion:^(BOOL completed) {
                         if (completed) {
                             [self.customActivityIndicator stopAnimating];
                             [self.customActivityIndicator removeFromSuperview];
                         }
                     }];
}

@end
