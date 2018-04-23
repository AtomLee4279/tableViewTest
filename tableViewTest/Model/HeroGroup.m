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
//获取heroArray数组中的某成员HeroModel中的参数
//index：heroArray索引值
//key：0/1/2=name/info/icon
-(NSString*)getHeroParamWithIndex:(NSUInteger)index andkey:(int)key
{
    NSString* result = @"";
    if (self.heroArray.count>=1) {
        HeroModel *hero = self.heroArray[index];
        switch (key) {
                //0:获取HeroModel中的name
            case 0:
                result = hero.name;
                break;
                //1:获取HeroModel中的info
            case 1:
                result = hero.info;
                break;
                //2:获取HeroModel中的icon
            case 2:
                result = hero.icon;
                break;
            default:
                break;
        }
    }
    return result;
}
@end
