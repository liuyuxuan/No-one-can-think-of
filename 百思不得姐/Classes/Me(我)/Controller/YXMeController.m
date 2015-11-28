//
//  YXMeController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/7.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXMeController.h"
#import "YXMeFootView.h"
#import "YXSettingController.h"
@interface YXMeController ()

@end

@implementation YXMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self setUpTableView];
}

- (void)setUpTableView
{
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    self.tableView.tableFooterView = [[YXMeFootView alloc]init];
}
#pragma mark   <UITableViewDelegate>
#pragma ----------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if(indexPath.section == 0)
    {
        cell.textLabel.text = @"登陆/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    }else
    {
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    }
    return cell;
}
#pragma mark   重写初始化方法
#pragma ----------------------------
- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

#pragma mark   设置导航栏
#pragma ----------------------------
- (void)setNavigationItem
{
    //标题
    UILabel *title = [[UILabel alloc]init];
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:20];
    title.text = @"我的";
    [title sizeToFit];
    self.navigationItem.titleView = title;
    //左边按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highlightedImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highlightedImage:@"mine-moon-icon-click" target:self action:@selector(moonButtonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
}

- (void)settingButtonClick
{
    YXSettingController *settingVc = [[YXSettingController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:settingVc animated:YES];
}
- (void)moonButtonClick
{
    YXLogFun
}

@end
