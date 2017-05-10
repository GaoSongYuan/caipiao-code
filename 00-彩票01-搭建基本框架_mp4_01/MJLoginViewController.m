//
//  MJLoginViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/29.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJLoginViewController.h"
#import "MJSettingViewController.h" // 由 设置按钮 push到 设置(setting)界面

@interface MJLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)setting;

@end

@implementation MJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"123123");
    
    UIImage *normal = [UIImage imageNamed:@"RedButton"];
    UIImage *high = [UIImage imageNamed:@"RedButtonPressed"];
    
    normal = [normal stretchableImageWithLeftCapWidth:normal.size.width * 0.5 topCapHeight:normal.size.height * 0.5];
    high = [high stretchableImageWithLeftCapWidth:high.size.width * 0.5 topCapHeight:high.size.height * 0.5];
    
    [self.loginBtn setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:high forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 监听点击 我的彩票 界面的 设置按钮
- (IBAction)setting {
    MJSettingViewController *settingVc = [[MJSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVc animated:YES]; // 由 设置按钮 push到 设置(setting)界面
    
}
@end
