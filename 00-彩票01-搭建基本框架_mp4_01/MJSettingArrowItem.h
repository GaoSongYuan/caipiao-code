//
//  MJSettingArrowItem.h
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/30.
//  Copyright © 2017年 Song. All rights reserved.


// 箭头

#import "MJSettingItem.h"

//typedef enum {
//    MJSettingArrowItemVcShowTypePush,
//    MJSettingArrowItemVcShowTypeModal
//}MJSettingArrowItemVcShowType;

@interface MJSettingArrowItem : MJSettingItem

@property(nonatomic,assign) Class destVcClass; // 即将需要跳转的控制器, 点击这行cell 需要跳转的控制器
//@property(nonatomic,assign) MJSettingArrowItemVcShowType vcShowType;


+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

@end
