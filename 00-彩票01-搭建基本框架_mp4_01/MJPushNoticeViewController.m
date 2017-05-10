//
//  MJPushNoticeViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/29.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJPushNoticeViewController.h"
//#import "MJSettingItem.h"
#import "MJSettingArrowItem.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"
//#import "MJSettingCell.h"

#import "MJProductViewController.h"
#import "MJPushNoticeViewController.h"
#import "MJAwardPushViewController.h"

#import "MJTest1ViewController.h"
#import "MJTest2ViewController.h"

#import "MBProgressHUD+MJ.h"


@interface MJPushNoticeViewController ()
//@property(nonatomic,strong) NSMutableArray *data;

@end

@implementation MJPushNoticeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.标题
//    self.title = @"设置";
        [self setupGroup0];
    //    [self setupGroup1];
}


// 第0组数据
-(void)setupGroup0 {
    MJSettingItem *MorePush = [MJSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" destVcClass:[MJAwardPushViewController class]];
    MJSettingItem *handShake = [MJSettingArrowItem itemWithIcon:nil title:@"中奖动画" destVcClass:[MJTest1ViewController class]];
    MJSettingItem *soundEffect = [MJSettingArrowItem itemWithIcon:nil title:@"比分直播提醒" destVcClass:[MJTest1ViewController class]];
    MJSettingItem *soundEffect1 = [MJSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒" destVcClass:[MJTest1ViewController class]];
    
    MJSettingGroup *group0 = [[MJSettingGroup alloc] init];
    group0.items = @[MorePush,handShake,soundEffect,soundEffect1];
    [self.data addObject:group0];
}


@end
