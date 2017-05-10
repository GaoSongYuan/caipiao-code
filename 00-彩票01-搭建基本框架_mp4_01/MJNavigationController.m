//
//  MJNavigationController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/27.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJNavigationController.h"

@interface MJNavigationController ()

@end

@implementation MJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"----- viewDidLoad"); //3
    
    // 无用
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}


// 系统在第一次使用这个类的时候调用（1个类只会调用一次）
+(void)initialize {
    
//    NSLog(@"----- initialize"); //2
    
    // 3.设置导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
    /*
     适配iOS6.0：
     if([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) { // 至少是iOS7.0
     [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
     }else { // 非iOS7.0
     [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
     }
     */
    
    
    // 设置标题文字颜色
//    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [navBar setTitleTextAttributes:attrs];
    
    // 更改navigation返回按钮的颜色，同时也更改了  Item 的颜色
    // setTintColor 可以设置item、返回按钮、返回按钮的箭头 的颜色， 但是无法设置字体大小
    [navBar setTintColor:[UIColor whiteColor]];

    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
//    itemAttrs[NSForegroundColorAttributeName] = [UIColor yellowColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
}

//+(void)load {
//    NSLog(@"----- load"); //1
//}


// 重写这个方法，能拦截所有的push操作 （覆盖）
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end
