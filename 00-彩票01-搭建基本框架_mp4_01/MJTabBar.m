//
//  MJTabBar.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/25.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJTabBar.h"
#import "MJTabBarButton.h"

//#define MJTabBarButtonCount 5

@interface MJTabBar()

// 记录当前选中的按钮
@property(nonatomic,weak) MJTabBarButton *selectedButton;

@end

@implementation MJTabBar

//// init方法内部会调用initWithFrame：方法
//-(id)initWithFrame:(CGRect)frame {       
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setupButtons];
//    }
//    return self;
//}


-(void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName {
    //创建按钮
    MJTabBarButton *button = [[MJTabBarButton alloc] init];
//    MJTabBarButton *button = [MJTabBarButton buttonWithType:UIButtonTypeCustom];
    
    
    // 设置图片
//    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal]; // 设置按钮背景图片 以及 形式（normal）
//    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    
//            // 设置frame
//            CGFloat buttonY = 0;
//            CGFloat buttonH = self.frame.size.height;
//            CGFloat buttonW = self.frame.size.width * 0.2;
//            CGFloat buttonX = i * buttonW;
//            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    
    // 显示
    [self addSubview:button];
    
    // 监听点击 UIControlEventTouchDown: 手指一按下去就会触发这个事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 默认点击（选中）第0个按钮
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}



//// 初始化按钮
//-(void)setupButtons {
//    for (int i = 0; i<MJTabBarButtonCount; i++) {
//        
//        //创建按钮
//        MJTabBarButton *button = [[MJTabBarButton alloc] init];
//        button.tag = i; // 绑定tag
//        
//        
//        // 设置图片
//        NSString *name = [NSString stringWithFormat:@"TabBar%d" , i+1]; // 名称
//        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal]; // 设置按钮背景图片 以及 形式（normal）
//        NSString *namesel = [NSString stringWithFormat:@"TabBar%dSel", i+1];
//        [button setBackgroundImage:[UIImage imageNamed:namesel] forState:UIControlStateSelected];
//        
//        //            // 设置frame
//        //            CGFloat buttonY = 0;
//        //            CGFloat buttonH = self.frame.size.height;
//        //            CGFloat buttonW = self.frame.size.width * 0.2;
//        //            CGFloat buttonX = i * buttonW;
//        //            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
//        
//        // 显示
//        [self addSubview:button];
//        
//        // 监听点击 UIControlEventTouchDown: 手指一按下去就会触发这个事件
//        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
//        
//        // 默认点击（选中）第0个按钮
//        if (i == 0) {
//            [self buttonClick:button];
//        }
//        
//    }
//}


// 当自己的尺寸确定的时候，拿出里面的5个按钮，一一设置fram
-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    int count = self.subviews.count;
    
//    NSLog(@"%d",count);
    
    for (int i = 0; i<count; i++) {
        MJTabBarButton *button = self.subviews[i];
        button.tag = i;
        
        // 设置frame
        CGFloat buttonY = 0;
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonW = self.frame.size.width / count;
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        
//        NSLog(@"%f",buttonH);
//        NSLog(@"%f",buttonW);
    }
    
}


// 监听按钮点击
-(void)buttonClick:(MJTabBarButton *)button {
    
    // 4. 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.让新点击的按钮选中
    button.selected = YES;
    
    // 3.新点击的按钮就成了当前选中的按钮
    self.selectedButton = button;
}

@end
