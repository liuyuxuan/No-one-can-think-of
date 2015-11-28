//
//  YXTopicViewController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/24.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTopicViewController.h"

#import "YXTopic.h"
#import "YXTopicCell.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension.h>
#import "YXNewController.h"
static NSString *const YXTopicCellId = @"YXTopicCell";
@interface YXTopicViewController()

@property (nonatomic,strong)NSMutableArray<YXTopic *> *topics;
@property (nonatomic,strong)AFHTTPSessionManager *manager;
@property (nonatomic,strong)NSString *maxtime;
- (NSString *)aParam;
@end


@implementation YXTopicViewController

- (NSString *)aParam
{
    if (self.parentViewController.class == [YXNewController class]) {
        return @"newlist";
    }
    return @"list";
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTableV];
    [self setRefresh];
}

- (void)setRefresh
{
    
    self.tableView.mj_header = [YXRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [YXRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDate)];
}
- (void)setTableV
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = YXGrayColor;
    self.tableView.contentInset  = UIEdgeInsetsMake(35 + 64, 0, 49, 0);
    //设置滚动条
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YXTopicCell class]) bundle:nil] forCellReuseIdentifier:YXTopicCellId];
}

#pragma mark   发送请求
#pragma ----------------------------
- (void)loadNewDate
{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = self.aParam;
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    
    [self.manager GET:YXCommonURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        
        self.topics = [YXTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        self.maxtime = responseObject[@"info"][@"maxtime"];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreDate
{
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = self.aParam;
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    params[@"maxtime"] = self.maxtime;
    
    [self.manager GET:YXCommonURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSArray *array = [YXTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:array];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


#pragma mark   <UITableViewDelegate>
#pragma ----------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YXTopicCell *cell = [self.tableView dequeueReusableCellWithIdentifier:YXTopicCellId];
    
    cell.topic = self.topics[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YXTopic *topic = self.topics[indexPath.row];
    return topic.cellHeight;
}

@end
