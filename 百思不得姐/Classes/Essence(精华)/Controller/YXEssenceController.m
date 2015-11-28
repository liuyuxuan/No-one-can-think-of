//
//  YXEssenceController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/7.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//
static int const YXEssenceChildCount = 5;

#import "YXEssenceController.h"
#import "YXAllController.h"
#import "YXVideoController.h"
#import "YXVoiceController.h"
#import "YXPictureController.h"
#import "YXWordController.h"
@interface YXEssenceController ()<UIScrollViewDelegate>
@property (nonatomic,weak)UIScrollView *scrollView;
@property (nonatomic,weak)UIView *titleView;  /**< <#...#>*/
@property (nonatomic,weak)UIButton *selcetBtn;  /**< <#...#>*/
@property (nonatomic,weak)UIView *titleIndexView;  /**< <#...#>*/
@end

@implementation YXEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    [self addScrollView];
    [self addTitleView];
    [self addChildViewController];
}
#pragma mark   添加控件
#pragma ----------------------------
- (void)addTitleView
{
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    titleView.frame = CGRectMake(0, 64, self.view.YX_width, 35);
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
     NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = titleView.YX_width / YXEssenceChildCount;
    CGFloat btnH = titleView.YX_height;
    CGFloat textW = 0;
    
    for (int i = 0; i < YXEssenceChildCount; i ++) {
        btnX = i *btnW;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [titleView addSubview:btn];
        textW = btn.titleLabel.YX_x;
        if (i==0) {
            [self titleBtnClick:btn];
        }
    }
    UIView *titleIndexView = [[UIView alloc]init];
    titleIndexView.backgroundColor = [UIColor redColor];
    titleIndexView.frame = CGRectMake(0, btnH - 1,textW , 1);
    titleIndexView.YX_centerX = btnW * 0.5;
    [titleView addSubview:titleIndexView];
    self.titleIndexView = titleIndexView;
}

- (void)addScrollView
{
    //不允许自动调整内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(self.view.YX_width * YXEssenceChildCount,0);
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    self.scrollView = scrollView;
    scrollView.backgroundColor = YXGrayColor;
}

- (void)addChildViewController
{
    [self addChildViewController:[[YXAllController alloc]init]];
    [self addChildViewController:[[YXVideoController alloc]init]];
    [self addChildViewController:[[YXVoiceController alloc]init]];
    [self addChildViewController:[[YXPictureController alloc]init]];
    [self addChildViewController:[[YXWordController alloc]init]];
    //默认加载第一个view
    [self addSubViews];
}

- (void)addSubViews
{
    int index = self.scrollView.contentOffset.x / self.view.YX_width;
    UIView *view = self.childViewControllers[index].view;
    view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:view];

}

#pragma mark - 标题按钮点击

- (void)titleBtnClick:(UIButton *)btn
{
    self.selcetBtn.selected = NO;
    btn.selected = YES;
    self.selcetBtn = btn;
    int index = btn.YX_x / btn.YX_width;
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = self.view.YX_width * index;
    [self.scrollView setContentOffset:offset animated:YES];
    
    
    [UIView animateWithDuration:0.25 animations:^{
        self.titleIndexView.YX_centerX = btn.YX_centerX;
    }];
}

#pragma mark   <UIScrollViewDelegate>
#pragma ----------------------------
//结束滚动动画时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addSubViews];
}
//结束滚动,人为拖拽
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.YX_width;
    UIButton *btn = self.titleView.subviews[index];
    [self titleBtnClick:btn];
    [self addSubViews];
}


#pragma mark   设置导航栏
#pragma ----------------------------
- (void)setNavigationItem
{
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightedImage:@"MainTagSubIconClick" target:self action:@selector(leftBarButtonClick)];
}

- (void)leftBarButtonClick
{
        UIBarButtonItem *item = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightedImage:@"MainTagSubIconClick" target:self action:@selector(leftBarButtonClick)];
}
@end
