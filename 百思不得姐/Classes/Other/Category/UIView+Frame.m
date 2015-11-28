//
//  UIView+Frame.m
//  彩票
//
//  Created by 刘雨轩 on 15/9/23.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)YX_width
{
    return self.bounds.size.width;
}
- (void)setYX_width:(CGFloat)YX_width
{
    CGRect frame = self.frame;
    frame.size.width = YX_width;
    self.frame = frame;
}
- (CGFloat)YX_height
{
    return self.bounds.size.height;
}
- (void)setYX_height:(CGFloat)YX_height
{
    CGRect frame = self.frame;
    frame.size.height = YX_height;
    self.frame = frame;
}
- (CGFloat)YX_x
{
    return self.frame.origin.x;
}
- (void)setYX_x:(CGFloat)YX_x
{
    CGRect frame = self.frame;
    frame.origin.x = YX_x;
    self.frame = frame;
    
}
- (CGFloat)YX_y
{
    return self.frame.origin.y;
}
- (void)setYX_y:(CGFloat)YX_y
{
    CGRect frame = self.frame;
    frame.origin.y = YX_y;
    self.frame = frame;
    
}

- (void)setYX_centerX:(CGFloat)YX_centerX
{
    CGPoint center = self.center;
    center.x = YX_centerX;
    self.center =center;
}
- (CGFloat)YX_centerX
{
    return self.center.x;
}

- (void)setYX_centerY:(CGFloat)YX_centerY
{
    CGPoint center = self.center;
    center.x = YX_centerY;
    self.center =center;
}
- (CGFloat)YX_centerY
{
    return self.center.y;
}
@end
