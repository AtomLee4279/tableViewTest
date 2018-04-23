//
//  HeroGroup.m
//  tableViewTest
//
//  Created by 李一贤 on 2018/4/21.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "HeroGroup.h"
#import "HeroModel.h"


@implementation HeroGroup
-(instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        [self setValue:dict[@"GroupTitle"] forKeyPath:@"GroupTitle"];
        NSMutableArray *heroArray = [NSMutableArray array];
        for (NSDictionary*tmpDict in dict[@"HeroArray"]) {
            HeroModel *hero = [HeroModel heroWithDict:tmpDict];
            [heroArray addObject:hero];
        }
        [self setValue:heroArray forKeyPath:@"heroArray"];
    }
    return self;
}
+(instancetype)heroGroupWithDict:(NSDictionary*)dict
{
    return [[self alloc] initWithDict: dict];
}
@end
