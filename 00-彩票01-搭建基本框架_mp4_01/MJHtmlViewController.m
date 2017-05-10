//
//  MJHtmlViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJHtmlViewController.h"
#import "MJHtml.h"

@interface MJHtmlViewController () <UIWebViewDelegate>

@end

@implementation MJHtmlViewController

-(void)loadView {
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.title = self.html.title;
    
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate= self;
    
    // 创建URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.html.html withExtension:nil];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 发送请求加载网页
    [webView loadRequest:request];
    
    // 设置左上角的关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    
}


-(void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 代理

/**
    网页加载完毕的时候调用
 */
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    // 调到id对应的网页标签
    // 拼接js代码
    NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';",self.html.ID];
    // 执行JavaScript 代码
    [webView stringByEvaluatingJavaScriptFromString:js];
}

@end
