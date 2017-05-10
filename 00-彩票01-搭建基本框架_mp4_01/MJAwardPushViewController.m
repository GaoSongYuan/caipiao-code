//
//  MJAwardPushViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJAwardPushViewController.h"
#import "MJSettingSwitchItem.h"
#import "MJSettingGroup.h"

@interface MJAwardPushViewController ()

@end

@implementation MJAwardPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJSettingItem *ball = [MJSettingSwitchItem itemWithIcon:nil title:@"双色球" ];
    MJSettingItem *letou = [MJSettingSwitchItem itemWithIcon:nil title:@"大乐透" ];
    
    MJSettingGroup *group0 = [[MJSettingGroup alloc] init];
    group0.items = @[ball,letou];
    group0.header = @"123";
    [self.data addObject:group0];
    
}



@end
