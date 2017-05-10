//
//  MJSettingArrowItem.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/30.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJSettingArrowItem.h"

@implementation MJSettingArrowItem

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(__unsafe_unretained Class)destVcClass {
    MJSettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}

@end
