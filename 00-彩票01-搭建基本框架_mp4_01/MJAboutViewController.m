//
//  MJAboutViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJAboutViewController.h"
#import "MJSettingGroup.h"
#import "MJSettingArrowItem.h"

@interface MJAboutViewController ()

@end

@implementation MJAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MJSettingItem *sms = [MJSettingArrowItem itemWithIcon:nil title:@"评分支持"];
    MJSettingItem *call = [MJSettingArrowItem itemWithIcon:nil title:@"客服电话"];
    call.subtitle = @"12345667";
    
    MJSettingGroup *group0 = [[MJSettingGroup alloc] init];
    group0.items = @[sms,call];
    [self.data addObject:group0];
    
}

@end
