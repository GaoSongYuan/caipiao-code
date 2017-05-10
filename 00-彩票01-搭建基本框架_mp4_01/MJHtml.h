//
//  MJHtml.h
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJHtml : NSObject

/**
    网页标题
 */
@property(nonatomic,copy) NSString *title;

/**
    网页文件名
 */
@property(nonatomic,copy) NSString *html;

/**
    id  
 */
@property(nonatomic,copy) NSString *ID;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)htmlWithDict:(NSDictionary *)dict;

@end
