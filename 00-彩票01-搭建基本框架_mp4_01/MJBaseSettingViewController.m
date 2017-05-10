//
//  MJBaseSettingViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/29.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJBaseSettingViewController.h"
//#import "MJSettingItem.h"
#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"
#import "MJSettingCell.h"




@interface MJBaseSettingViewController ()

@end

@implementation MJBaseSettingViewController

-(instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray *)data {
    if (_data == nil) {
        _data = [NSMutableArray array];
        

    }
    return _data;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { // 设置 组数 sections
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // 设置 每组的cell数 rows
    MJSettingGroup *group = self.data[section];
    return group.items.count;
}

// 创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    MJSettingCell *cell = [MJSettingCell cellWithTableView:tableView];
    
    // 2.给cell传递模型数据
    MJSettingGroup *group = self.data[indexPath.section];
    MJSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    //    cell.imageView.image = [UIImage imageNamed:item.icon];
    //    cell.textLabel.text = item.title;
    
    return cell;
}

// 选中 cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath { // 选中 cell
    // 1.取消选中这行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.模型处理
    MJSettingGroup *group = self.data[indexPath.section];
    MJSettingItem *item = group.items[indexPath.row];
    
    if (item.option !=nil) { // block有值（点击这个cell 有特定的操作需要执行）
        item.option();
    }else if ([item isKindOfClass:[MJSettingArrowItem class]]) { // 箭头
        MJSettingArrowItem *arrowItem = (MJSettingArrowItem *)item;
        
        // 如果没有需要跳转的控制器
        if (arrowItem.destVcClass == nil) return;
        
        UIViewController *vc = [[arrowItem.destVcClass alloc] init];
        vc.title = arrowItem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

// 组的头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    MJSettingGroup *group = self.data[section];
    return group.header;
}

// 组的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    MJSettingGroup *group = self.data[section];
    return group.footer;
}


@end
