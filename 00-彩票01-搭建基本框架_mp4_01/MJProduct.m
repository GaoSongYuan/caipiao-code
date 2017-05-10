//
//  MJProduct.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/7.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "MJProduct.h"

@implementation MJProduct

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        
    }
    return self;
}

+(instancetype)productWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
