//
//  QYFriendGroup.h
//  02-QQ好友
//
//  Created by qingyun on 15/9/17.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriendGroup : NSObject
//声明属性
@property (nonatomic, strong)NSString *name;
@property (nonatomic) int online;
@property (nonatomic, strong)NSArray *friends;

@property (nonatomic) BOOL isOpen;

//声明初始化方法
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)friendGroupWithDictionary:(NSDictionary *)dict;
@end
