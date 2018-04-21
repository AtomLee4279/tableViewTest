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
@property(nonatomic,strong)NSString* groupName;
@property(nonatomic,strong)HeroModel* heroModel;
@end
