//
//  QYFriendGroup.m
//  02-QQ好友
//
//  Created by qingyun on 15/9/17.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYFriendGroup.h"
#import "QYFriend.h"
@implementation QYFriendGroup
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //把friends中的字典转化成模型数据
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            QYFriend *friend = [QYFriend friendWithDictionary:dic];
            [array addObject:friend];
        }
        self.friends = array;
    }
    return self;
}
+ (instancetype)friendGroupWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}
@end
