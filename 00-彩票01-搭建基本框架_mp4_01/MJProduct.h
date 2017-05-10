//
//  MJProduct.h
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/7.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJProduct : NSObject

@property (nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *icon;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)productWithDict:(NSDictionary *)dict;

@end
