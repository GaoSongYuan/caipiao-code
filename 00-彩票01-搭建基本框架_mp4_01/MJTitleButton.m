//
//  MJTitleButton.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/3/28.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJTitleButton.h"

@interface MJTitleButton()

@property(nonatomic,strong) UIFont *titleFont;
@end

@implementation MJTitleButton

//-(void)awakeFromNib {
//    
//}

#pragma mark - 自定义控件，写出以下三个方法
// 自定义控件，写出以下三个方法：initWithCoder initWithFrame setup
// 从文件中解析一个对象的时候就会调用这个方法
-(instancetype)initWithCoder:(NSCoder *)aDecoder { // 从文件中创建
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

// 通过代码创建控件的时候就会调用这个方法
-(instancetype)initWithFrame:(CGRect)frame { // 从代码中创建
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

// 初始化
-(void)setup {
    self.titleFont = [UIFont systemFontOfSize:17];
    self.titleLabel.font = self.titleFont;
    
    // 图标居中
    self.imageView.contentMode = UIViewContentModeCenter;
}
#pragma mark - 自定义控件，写出以上三个方法


-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
    CGFloat titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    CGFloat titleH = contentRect.size.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = 30;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageY = 0;
    CGFloat imageH = contentRect.size.height;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

@end
