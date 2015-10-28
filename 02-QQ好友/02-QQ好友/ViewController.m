//
//  ViewController.m
//  02-QQ好友
//
//  Created by qingyun on 15/9/17.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYFriendGroup.h"
#import "QYFriend.h"
#import "QYSectionHeaderView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *groups;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reload) name:@"reloadData" object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"reloadData" object:nil];
}

-(void)reload
{
    [_tableView reloadData];
}

-(NSArray *)groups
{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *xuecheng = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            QYFriendGroup *friendGroup = [QYFriendGroup friendGroupWithDictionary:dic];
            [xuecheng addObject:friendGroup];
        }
        _groups = xuecheng;
    }
    return _groups;
}

#pragma mark - UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QYFriendGroup *fGroup = self.groups[section];
    if (fGroup.isOpen) {
        return fGroup.friends.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    }
    
    //取出当前section对应的数据模型
    QYFriendGroup *friendGroup = (QYFriendGroup *)self.groups[indexPath.section];
    
    QYFriend *zhanglei = friendGroup.friends[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:zhanglei.icon];
    cell.textLabel.text = zhanglei.name;
    cell.detailTextLabel.text = [zhanglei status];
    cell.textLabel.textColor = zhanglei.vip ? [UIColor redColor] : [UIColor blackColor];
    
    return cell;
}

#if 0
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    QYFriendGroup *friendGroup = (QYFriendGroup *)self.groups[section];
    return friendGroup.name;
}
#endif
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    QYSectionHeaderView *sectionHeaderView = [QYSectionHeaderView headerViewWithTableView:tableView];
    //sectionHeaderView.contentView.backgroundColor = [UIColor redColor];
    QYFriendGroup *friendGroup = (QYFriendGroup *)self.groups[section];
    sectionHeaderView.group = friendGroup;
//    sectionHeaderView.headerViewClick = ^(){
//        [tableView reloadData];
//    };
    return sectionHeaderView;
}


@end
