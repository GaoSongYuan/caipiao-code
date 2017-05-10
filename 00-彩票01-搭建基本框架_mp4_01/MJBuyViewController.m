//
//  MJBuyViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/28.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJBuyViewController.h"

@interface MJBuyViewController ()
- (IBAction)titleClick:(UIButton *)sender;

@property (nonatomic,assign,getter=isOpen) BOOL  open; // open 默认是 NO ---- 0

@end

@implementation MJBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)titleClick:(UIButton *)sender {
    // 1.按钮旋转
//    [UIButton animateWithDuration:0.25 animations:^{
//        sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
//    }];
    
//    NSLog(@"----------%d",self.isOpen); // 0
    
    if (!self.isOpen) { // 1
        [UIView animateWithDuration:0.25 animations:^{
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        self.open = YES; // 已经旋转
    }
    else // 0
    {
        [UIView animateWithDuration:0.25 animations:^{
            sender.imageView.transform = CGAffineTransformIdentity;
        }];
        self.open = NO;
    }
    
    
    // 2.添加UIview
    UIView *temp = [[UIView alloc] init];
    temp.frame = CGRectMake(10, 100, 100, 30);
    temp.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:temp];
    
}
@end
