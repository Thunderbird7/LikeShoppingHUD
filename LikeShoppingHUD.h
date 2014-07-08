//
//  LikeShoppingHUD.h
//  LikeShopping
//
//  Created by Thunderbird on 7/7/2557 BE.
//  Copyright (c) 2557 E-Commerce Solution Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikeShoppingHUD : UIView

@property (readwrite, nonatomic, retain) UIImageView *customActivityIndicator;

+ (void)show;
+ (void)dismiss;

@end
