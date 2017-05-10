//
//  MJSettingGroup.h
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/30.
//  Copyright © 2017年 Song. All rights reserved.


// 每一组的模型

#import <Foundation/Foundation.h>

@interface MJSettingGroup : NSObject

@property(nonatomic,copy) NSString *header; // 头部标题
@property(nonatomic,copy) NSString *footer; // 尾部标题
@property(nonatomic,strong) NSArray *items; // 存放着这组所有行的模型数据(这个数组中都是MJSettingItem对象)

@end
