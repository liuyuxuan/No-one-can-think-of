//
//  YXseeBigController.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/25.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXseeBigController.h"
#import <UIImageView+WebCache.h>
@interface YXseeBigController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation YXseeBigController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)setTopic:(YXTopic *)topic
{
    _topic = topic;
    UIImageView *imageView = [[UIImageView alloc]init];
    [self.scrollView addSubview:imageView];
}

#pragma mark   btn
#pragma ----------------------------
- (IBAction)saveImage:(id)sender {
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
