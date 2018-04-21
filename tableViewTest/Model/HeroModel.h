//
//  TableModel.h
//  tableViewTest
//
//  Created by 李一贤 on 2018/4/21.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject

@property(nonatomic,strong) NSString*info;
@property(nonatomic,strong) NSString*icon;
@property(nonatomic,strong) NSString*name;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)heroWithDict:(NSDictionary*)dict;

@end
