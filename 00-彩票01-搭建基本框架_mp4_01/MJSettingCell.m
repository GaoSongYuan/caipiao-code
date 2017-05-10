//
//  MJSettingCell.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/30.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJSettingCell.h"
#import "MJSettingItem.h"
#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"

@interface MJSettingCell()
// 箭头
@property(nonatomic,strong) UIImageView *arrowView;
// 开关
@property(nonatomic,strong) UISwitch *switchView;
@end

@implementation MJSettingCell

// 懒加载
-(UIImageView *)arrowView {
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

// 懒加载
-(UISwitch *)switchView {
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

/**
    监听开关状态改变
 */
-(void)switchStateChange {
//    NSLog(@"%@ -- %d",self.item.title,self.switchView.isOn);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    [defaults synchronize];
    
}


+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"setting";
    MJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MJSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}


-(void)setItem:(MJSettingItem *)item {
    _item = item;
    
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边内容
    [self setupRightContent];
    
}

// 设置数据
-(void)setupData {
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.subtitle; // 客服电话的 subtitle
}

// 设置右边内容
-(void)setupRightContent {
    
    if ([self.item isKindOfClass:[MJSettingArrowItem class]]) { // 箭头
        self.accessoryView = self.arrowView;
    }else if ([self.item isKindOfClass:[MJSettingSwitchItem class]]) { // 开关
        self.accessoryView = self.switchView;
        // 不允许cell点击选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 设置开关的状态
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.switchView.on = [defaults boolForKey:self.item.title];
        
    }else {
        self.accessoryView = nil;
    }
    
}

@end
