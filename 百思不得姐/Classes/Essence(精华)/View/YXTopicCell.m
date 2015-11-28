//
//  YXTopicCell.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/19.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTopicCell.h"
#import "YXTopic.h"
#import <UIImageView+WebCache.h>
#import "YXUser.h"
#import "YXTopic.h"
#import "YXComment.h"
#import "YXTopicPictureView.h"
#import "YXTopicVideoView.h"
#import "YXTopicVoiceView.h"

@interface YXTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon_img;
@property (weak, nonatomic) IBOutlet UILabel *name_lab;

@property (weak, nonatomic) IBOutlet UILabel *time_lab;
@property (weak, nonatomic) IBOutlet UIButton *more_btn;
@property (weak, nonatomic) IBOutlet UILabel *content_lab;
@property (weak, nonatomic) IBOutlet UIButton *ding_btn;
@property (weak, nonatomic) IBOutlet UIButton *cai_btn;
@property (weak, nonatomic) IBOutlet UIButton *share_btn;
@property (weak, nonatomic) IBOutlet UIButton *comment_btn;
@property (weak, nonatomic) IBOutlet UILabel *hotContent_lab;

@property (weak, nonatomic) IBOutlet UIView *hot_V;

@property (nonatomic,weak)YXTopicPictureView *pictureV;  /**< 图片控件*/

@property (nonatomic,weak)YXTopicVideoView *videoV;  /**< 视频*/

@property (nonatomic,weak)YXTopicVoiceView *voiceV;  /**< 声音*/

@end

@implementation YXTopicCell

#pragma mark   懒加载
#pragma ----------------------------

- (YXTopicPictureView *)pictureV
{
    if (!_pictureV) {
        YXTopicPictureView *pictureV = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YXTopicPictureView class]) owner:nil options:nil].lastObject;
        [self.contentView addSubview:pictureV];
        _pictureV = pictureV;
    }
    return _pictureV;
}

- (YXTopicVideoView *)videoV
{
    if (!_videoV) {
        YXTopicVideoView * videoV = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YXTopicVideoView class]) owner:nil options:nil].lastObject;
        [self.contentView addSubview:videoV];
        _videoV = videoV;
    }
    return _videoV;
}

- (YXTopicVoiceView *)voiceV
{
    if (!_voiceV) {
        YXTopicVoiceView *voiceV = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YXTopicVoiceView class]) owner:nil options:nil].lastObject;
        [self.contentView addSubview:voiceV];
        _voiceV = voiceV;
    }
    return _voiceV;
}

#pragma mark   set方法
#pragma ----------------------------
- (void)setTopic:(YXTopic *)topic
{
    _topic = topic;
    //设置数据
    [self setDate:topic];
}

- (void)setDate:(YXTopic *)topic
{
    [self.icon_img sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.name_lab.text = topic.name;
    self.time_lab.text = topic.created_at;
    
    self.content_lab.text = topic.text;
    [self setBtn:self.ding_btn textInNumber:topic.ding placeholderText:@"顶"];
    [self setBtn:self.cai_btn textInNumber:topic.cai placeholderText:@"踩"];
    [self setBtn:self.share_btn textInNumber:topic.repost placeholderText:@"分享"];
    [self setBtn:self.comment_btn textInNumber:topic.comment placeholderText:@"评论"];
    
    if (topic.top_cmt) {
        self.hotContent_lab.text = [NSString stringWithFormat:@"%@ : %@",topic.top_cmt.user.username,topic.top_cmt.content];
        self.hot_V.hidden =NO;
    }else
    {
        self.hot_V.hidden = YES;
    }
    //中间内容
    if (topic.type == YXTopicTypePicture) {         //图片
        
        self.pictureV.hidden = NO;
        self.voiceV.hidden = YES;
        self.videoV.hidden = YES;
        self.pictureV.frame = topic.contentF;
        self.pictureV.topic = topic;
        
    }else if (topic.type == YXTopicTypeVideo) {         //视频
        self.pictureV.hidden = YES;
        self.voiceV.hidden = YES;
        self.videoV.hidden = NO;
        self.videoV.frame = topic.contentF;
        self.videoV.topic = topic;
        
    }else if (topic.type == YXTopicTypeVoice) {         //音乐
        self.pictureV.hidden = YES;
        self.voiceV.hidden = NO;
        self.videoV.hidden = YES;
        self.voiceV.frame = topic.contentF;
        self.voiceV.topic = topic;
       
    }else if (topic.type == YXTopicTypeWord) {         //文字
        self.pictureV.hidden = YES;
        self.voiceV.hidden = YES;
        self.videoV.hidden = YES;
        
    }
    
}
- (IBAction)moreBtnClick:(UIButton *)sender {
    UIAlertController *alertVc = [[UIAlertController alloc]init];
    
    [alertVc addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       YXLogFun
    }]];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        YXLogFun
    }]];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        YXLogFun
    }]];
    [self.window.rootViewController presentViewController:alertVc animated:YES completion:nil];
}

#pragma mark   设置一个按钮文字
#pragma ----------------------------

- (void)setBtn:(UIButton *)btn textInNumber:(NSInteger)number placeholderText:(NSString *)placeholderText;
{
    if (number >=10000) {
        [btn setTitle:[NSString stringWithFormat:@"%ld万",number / 10000] forState:UIControlStateNormal];
    }else if(number >0)
    {
       [btn setTitle:[NSString stringWithFormat:@"%ld",number] forState:UIControlStateNormal];
    }else
    {
        [btn setTitle:placeholderText forState:UIControlStateNormal];
    }
    
}

- (void)awakeFromNib
{
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -= YXMargin;
    frame.origin.y += YXMargin;
    [super setFrame:frame];
}
@end
