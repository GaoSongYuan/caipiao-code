//
//  MJTabBarController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/25.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJTabBarController.h"
#import "MJTabBar.h"
#import "MJTabBarButton.h"

@interface MJTabBarController ()<MJTabBarDelegate>

@end

@implementation MJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.删除并创建tabbar
//    [self.tabBar removeFromSuperview]; // 删除系统自带的tabbar
    
    
    // 1.添加自己的tabbar
    MJTabBar *myTabBar = [[MJTabBar alloc] init]; // 自己创建tabbar --- myTabBar
    myTabBar.frame = self.tabBar.bounds; // myTabBar的frame与 系统自带的frame 相同  (覆盖系统的tabbar)
    myTabBar.delegate = self;
    myTabBar.backgroundColor = [UIColor blackColor];
    [self.tabBar addSubview:myTabBar]; // 显示到view上
    
    // 2.添加对应个数的按钮
    for (int i = 0; i<self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"TabBar%d",i+1];
        NSString *selname = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [myTabBar addTabButtonWithName:name selName:selname];
    }
    
//    // 3.设置导航栏主题
//    UINavigationBar *navBar = [UINavigationBar appearance];
//    // 设置背景图片
//    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//    
//        
///*
//     适配iOS6.0：
//     if([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) { // 至少是iOS7.0
//        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//     }else { // 非iOS7.0
//        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
//     }
//*/
//    
//    
//    // 设置标题文字颜色
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[UITextAttributeTextColor] = [UIColor whiteColor];
//    [navBar setTitleTextAttributes:attrs];
    
}




#pragma mark - MJTabBar的代理方法
-(void)tabBar:(MJTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to {
    // 选中最新的控制器
    self.selectedIndex = to;
}


@end
