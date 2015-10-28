//
//  QYSectionHeaderView.h
//  02-QQ好友
//
//  Created by qingyun on 15/9/17.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYFriendGroup;
@interface QYSectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong)QYFriendGroup *group;

//@property (nonatomic, strong) void(^headerViewClick)(void);

+(instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
