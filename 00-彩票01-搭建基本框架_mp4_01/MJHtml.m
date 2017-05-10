//
//  MJHtml.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/10.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJHtml.h"

@implementation MJHtml


-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
        
    }
    return self;
}

+(instancetype)htmlWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
