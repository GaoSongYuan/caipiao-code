//
//  MJTabBar.h
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/25.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJTabBar;

@protocol  MJTabBarDelegate <NSObject>

@optional
-(void)tabBar:(MJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end

@interface MJTabBar : UIView
@property (nonatomic,weak) id<MJTabBarDelegate> delegate;

-(void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName;

@end
