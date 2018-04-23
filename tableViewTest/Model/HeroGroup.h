//
//  HeroGroup.h
//  tableViewTest
//
//  Created by 李一贤 on 2018/4/21.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HeroModel;
@interface HeroGroup : NSObject
@property(nonatomic,strong)NSString* GroupTitle;
@property(nonatomic,copy)NSArray* heroArray;
-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)heroGroupWithDict:(NSDictionary*)dict;
-(NSString*)getHeroParamWithIndex:(NSUInteger)index andkey:(int)key;
@end
