//
//  MJSettingCell.h
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/30.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MJSettingItem;

@interface MJSettingCell : UITableViewCell

@property(nonatomic,strong) MJSettingItem *item;

// 提供一个方法来创建cell
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
