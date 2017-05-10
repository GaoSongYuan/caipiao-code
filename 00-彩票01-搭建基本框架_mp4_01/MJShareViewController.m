//
//  MJShareViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJShareViewController.h"
#import "MJSettingGroup.h"
#import "MJSettingArrowItem.h"

@interface MJShareViewController ()

@end

@implementation MJShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJSettingItem *sina = [MJSettingArrowItem itemWithIcon:@"MorePush" title:@"微博分享" destVcClass:nil];
    MJSettingItem *sms = [MJSettingArrowItem itemWithIcon:@"handShake" title:@"短信分享"];
    MJSettingItem *mail = [MJSettingArrowItem itemWithIcon:@"sound_Effect" title:@"邮件分享"];
    
    MJSettingGroup *group0 = [[MJSettingGroup alloc] init];
    group0.items = @[sina,sms,mail];
    [self.data addObject:group0];
    
}



@end
