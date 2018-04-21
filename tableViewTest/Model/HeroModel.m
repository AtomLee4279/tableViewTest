//
//  TableModel.m
//  tableViewTest
//
//  Created by 李一贤 on 2018/4/21.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel
-(instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)heroWithDict:(NSDictionary*)dict
{
    return [[self alloc] initWithDict: dict];
}
@end
