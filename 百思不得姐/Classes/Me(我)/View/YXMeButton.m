//
//  YXMeButton.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/15.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXMeButton.h"
#import "YXMeSquare.h"
#import <UIButton+WebCache.h>
@implementation YXMeButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setSquare:(YXMeSquare *)square
{
    _square = square;
    [self setTitle:square.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:square.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"setup-head-default"]];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.YX_y = self.YX_height * 0.15;
    self.imageView.YX_height = self.YX_height * 0.5;
    self.imageView.YX_width = self.imageView.YX_height;
    self.imageView.YX_centerX = self.YX_width * 0.5;
    
    self.titleLabel.YX_x = 0;
    self.titleLabel.YX_y = self.imageView.YX_y + self.imageView.YX_height;
    self.titleLabel.YX_width = self.YX_width;
    self.titleLabel.YX_height = self.YX_height - self.titleLabel.YX_y;
}

@end
