//
//  MJSettingItem.h
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/30.
//  Copyright © 2017年 Song. All rights reserved.


// 每一个 cell 对应一个MJSettingItem模型

#import <Foundation/Foundation.h>

typedef void(^MJSettingItemOption)();

@interface MJSettingItem : NSObject

@property(nonatomic,copy) NSString *icon; // 图标
@property(nonatomic,copy) NSString *title; // 标题
@property(nonatomic,copy) NSString *subtitle; // 子标题
@property(nonatomic,copy) MJSettingItemOption option; // 点击那个cell需要做什么事情

//@property(nonatomic,assign) Class destVcClass; // 即将需要跳转的控制器, 点击这行cell 需要跳转的控制器

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
//+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

@end
