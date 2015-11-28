//
//  YXSettingController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/16.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXSettingController.h"
#import "YXClearCachesCell.h"

@implementation YXSettingController



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        static NSString * YXClearCachesCellId = @"YXClearCachesCell";
        YXClearCachesCell *cell = [self.tableView dequeueReusableCellWithIdentifier:YXClearCachesCellId];
        if (!cell) {
        cell = [[YXClearCachesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YXClearCachesCellId];
        }
        return cell;
    }else
    {
        static NSString * Id = @"cell";
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:Id];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"    %ld--%ld",indexPath.section,indexPath.row];
        cell.backgroundColor = [UIColor grayColor];
        return cell;
    }
}

@end
