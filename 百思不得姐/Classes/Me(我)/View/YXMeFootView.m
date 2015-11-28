//
//  YXMeFootView.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/15.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXMeFootView.h"
#import "YXMeSquare.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "YXMeButton.h"
@implementation YXMeFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"a"] = @"square";
        dict[@"c"] = @"topic";
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php"  parameters:dict success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
          NSArray *array =  [YXMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [self setBtnWithArray:array];
        } failure:nil];
    }
    return self;
}

- (void)setBtnWithArray:(NSArray *)array
{
    int maxBtnCount = 4;
    CGFloat btnW = self.YX_width / maxBtnCount;
    CGFloat btnH = btnW;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    
    for (int i = 0; i < array.count; i++) {
        btnX = i % maxBtnCount *btnW;
        btnY = i / maxBtnCount *btnW;
        YXMeButton *btn = [[YXMeButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
         btn.square = array[i];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
    
    }
    self.YX_height = (array.count + maxBtnCount - 1) / maxBtnCount * btnW;
    //重新刷新列表
    UITableView *tableView = (UITableView *)self.superview;
    tableView.tableFooterView = self;
    [tableView reloadData];
}

- (void)btnClick:(UIButton *)btn
{
    YXLogFun
}
@end
