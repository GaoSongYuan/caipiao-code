//
//  MJHelpViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJHelpViewController.h"
#import "MJSettingGroup.h"
#import "MJSettingArrowItem.h"
#import "MJHtmlViewController.h"
#import "MJNavigationController.h"
#import "MJHtml.h"


@interface MJHelpViewController ()
@property(nonatomic,strong) NSArray *htmls;
@end

@implementation MJHelpViewController

-(NSArray *)htmls {
    if (_htmls == nil) {
        
        // json文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        // 加载json文件
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        // 将json数据转为NSArray 或者 NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 将字典转成模型
        NSMutableArray *htmlArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJHtml *p = [MJHtml htmlWithDict:dict];
            [htmlArray addObject:p];
        }
        
        
        _htmls = htmlArray;
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建所有的item
    NSMutableArray *items = [NSMutableArray array];
    for (MJHtml *html in self.htmls) {
        MJSettingItem *item = [MJSettingArrowItem itemWithIcon:nil title:html.title destVcClass:html.html.class];
        [items addObject:item];
    }
    
    // 2.创建组
    MJSettingGroup *group0 = [[MJSettingGroup alloc] init];
    group0.items = items;
    [self.data addObject:group0];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MJHtmlViewController *htmlVc = [[MJHtmlViewController alloc] init];
    
    htmlVc.html = self.htmls[indexPath.row];
    
    MJNavigationController *nav = [[MJNavigationController alloc] initWithRootViewController:htmlVc];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
