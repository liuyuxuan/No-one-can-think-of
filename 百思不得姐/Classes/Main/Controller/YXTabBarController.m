//
//  YXTabBarController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/5.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTabBarController.h"
#import "YXNavigationController.h"
#import "YXTabBar.h"
#import "YXEssenceController.h"
#import "YXNewController.h"
#import "YXMeController.h"
#import "YXFollowController.h"
@interface YXTabBarController ()

@end

@implementation YXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

- (void)setUp
{
    [self setValue:[[YXTabBar alloc]init] forKey:@"tabBar"];
    //设置文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    
    NSMutableDictionary *nomalAttrs = [NSMutableDictionary dictionary];
    nomalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    nomalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:nomalAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    //添加自控制器
    [self addOneChildController:[[YXEssenceController alloc]init] Title:@"精华" Image:@"tabBar_essence_icon" SelectImage:@"tabBar_essence_click_icon"];
    [self addOneChildController:[[YXNewController alloc]init] Title:@"新帖" Image:@"tabBar_new_icon" SelectImage:@"tabBar_new_click_icon"];
    [self addOneChildController:[[YXFollowController alloc]init] Title:@"关注" Image:@"tabBar_friendTrends_icon" SelectImage:@"tabBar_friendTrends_click_icon"];
    [self addOneChildController:[[YXMeController alloc]init] Title:@"我" Image:@"tabBar_me_icon" SelectImage:@"tabBar_me_click_icon"];
    
    
}

#pragma mark   添加一个子控制器
#pragma ----------------------------
- (void)addOneChildController:(UIViewController *)vc Title:(NSString *)title Image:(NSString *)image SelectImage:(NSString *)selectImage
{
    [vc.tabBarItem setTitle:title];
    [vc.tabBarItem setImage:[UIImage imageNamed:image]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:selectImage]];
    YXNavigationController *nVc = [[YXNavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nVc];
}

@end
