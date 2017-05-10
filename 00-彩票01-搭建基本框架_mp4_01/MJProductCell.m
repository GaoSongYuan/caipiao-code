//
//  MJProductCell.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/9.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJProductCell.h"
#import "MJProduct.h"

@interface MJProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation MJProductCell

-(void)setProduct:(MJProduct *)product {
    _product = product;
    
    // 1.设置头像
    self.iconView.image = [UIImage imageNamed:product.icon];
    
    // 2.设置名称
    self.nameLabel.text = product.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.iconView.layer.cornerRadius = 8; // 圆角
    self.iconView.clipsToBounds = YES;
}

@end
