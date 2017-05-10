//
//  MJSettingItem.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/30.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJSettingItem.h"
//#import "MJSettingArrowItem.h"

@implementation MJSettingItem

//+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(__unsafe_unretained Class)destVcClass {
//    MJSettingItem *item = [self itemWithIcon:icon title:title];
//    item.destVcClass = destVcClass;
//    return item;
//}

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    MJSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

@end
