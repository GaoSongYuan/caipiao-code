//
//  MJSettingViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/29.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJSettingViewController.h"
//#import "MJSettingItem.h"
#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"
#import "MJSettingCell.h"

#import "MJProductViewController.h"
#import "MJPushNoticeViewController.h"
#import "MJHelpViewController.h"
#import "MJShareViewController.h"
#import "MJAboutViewController.h"

#import "MJTest1ViewController.h"
#import "MJTest2ViewController.h"

#import "MBProgressHUD+MJ.h"


@interface MJSettingViewController ()
//@property(nonatomic,strong) NSMutableArray *data;

@end

@implementation MJSettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.标题
    self.title = @"设置";
    [self setupGroup0];
    [self setupGroup1];
}


// 第0组数据
-(void)setupGroup0 {
    MJSettingItem *MorePush = [MJSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[MJPushNoticeViewController class]];
    MJSettingItem *handShake = [MJSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    MJSettingItem *soundEffect = [MJSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    MJSettingGroup *group0 = [[MJSettingGroup alloc] init];
    group0.items = @[MorePush,handShake,soundEffect];
    [self.data addObject:group0];
}

// 第1组数据
-(void)setupGroup1 {
    MJSettingItem *update = [MJSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    
    // 回调block
    update.option = ^{
        // 弹框提示
        [MBProgressHUD showMessage:@"正在加载"];
        
        // 几秒后消失，再次提醒
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showError:@"没有新版本"];
        });
        
    };
    
    MJSettingItem *help = [MJSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[MJHelpViewController class]];
    MJSettingItem *share = [MJSettingArrowItem itemWithIcon:@"MoreHelp" title:@"分享" destVcClass:[MJShareViewController class]];
    MJSettingItem *viewMsg = [MJSettingArrowItem itemWithIcon:@"MoreHelp" title:@"查看消息" destVcClass:[MJTest1ViewController class]];
    MJSettingItem *product = [MJSettingArrowItem itemWithIcon:@"MoreHelp" title:@"产品推荐" destVcClass:[MJProductViewController class]];
    MJSettingItem *about = [MJSettingArrowItem itemWithIcon:@"MoreHelp" title:@"关于" destVcClass:[MJAboutViewController class]];

    MJSettingGroup *group1 = [[MJSettingGroup alloc] init];
    group1.items = @[update,help,share,viewMsg,product,about];
    [self.data addObject:group1];
}



@end
